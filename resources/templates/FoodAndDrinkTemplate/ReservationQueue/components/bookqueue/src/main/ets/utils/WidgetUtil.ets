import { preferences } from '@kit.ArkData';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { formBindingData, formProvider } from '@kit.FormKit';
import { cancelQueueOrderApi } from '../network/apis/ApiList';
import { Logger } from './Logger';

const TAG = '[WidgetUtil]';

export class WidgetUtil {
  private static readonly _fileName: string = 'form_id_file';
  private static readonly _formIdKey: string = 'form_id_key';
  private static readonly _queueOrderKey: string = 'queue_order_key';
  private static readonly _formIdEventName: string = 'form_id_event_name';
  private static readonly _queueIdEventName: string = 'queue_id_event_name';

  public static getFormIds(ctx: Context) {
    const store = WidgetUtil._getStore(ctx);
    return store.getSync(WidgetUtil._formIdKey, []) as string[];
  }

  public static async addFormId(formId: string, ctx: Context) {
    const list = WidgetUtil.getFormIds(ctx);
    if (!list.some(id => id === formId)) {
      list.push(formId);
      const store = WidgetUtil._getStore(ctx);
      store.putSync(WidgetUtil._formIdKey, list);
      await store.flush();
    }
  }

  public static async delFormId(formId: string, ctx: Context) {
    const list = WidgetUtil.getFormIds(ctx);
    const index = list.findIndex(id => id === formId);
    if (index !== -1) {
      list.splice(index, 1);
      const store = WidgetUtil._getStore(ctx);
      store.putSync(WidgetUtil._formIdKey, list);
      await store.flush();
    }
  }

  // 传递卡片id
  public static publishFormId(formId: string, isDelete: boolean) {
    commonEventManager.publish(WidgetUtil._formIdEventName, { data: formId, parameters: { isDelete } },
      (err: BusinessError) => {
        if (err) {
          Logger.error(TAG, `Failed to publish formId event. Code is ${err.code}, message is ${err.message}`);
        } else {
          Logger.info(TAG, 'Succeeded in publishing formId event.');
        }
      });
  }

  // 订阅获取卡片id
  public static async subscribeFormId(ctx: Context) {
    let subscriber: commonEventManager.CommonEventSubscriber;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = { events: [WidgetUtil._formIdEventName] };
    commonEventManager.createSubscriber(subscribeInfo, (formIdErr1, formIdData1) => {
      if (formIdErr1) {
        Logger.error(TAG,
          `Failed to create formId subscriber. Code is ${formIdErr1.code}, message is ${formIdErr1.message}`);
        return;
      }
      subscriber = formIdData1;
      commonEventManager.subscribe(subscriber, (formIdErr2, formIdData2) => {
        if (formIdErr2) {
          Logger.error(TAG,
            `Failed to subscribe formId event. Code is ${formIdErr2.code}, message is ${formIdErr2.message}`);
          return;
        } else {
          if (formIdData2.parameters?.isDelete) {
            WidgetUtil.delFormId(formIdData2.data as string, ctx);
          } else {
            WidgetUtil.addFormId(formIdData2.data as string, ctx);
          }
        }
      });
    });
  }

  public static getQueueOrder(ctx: Context) {
    const store = WidgetUtil._getStore(ctx);
    return store.getSync(WidgetUtil._queueOrderKey, {
      orderId: 0,
      count: 0,
      mine: 0,
      now: 0,
      wait: 0,
    }) as QueueOrder;
  }

  // 传递排号订单id
  public static publishQueueId(queueOrderId: number) {
    commonEventManager.publish(WidgetUtil._queueIdEventName, { data: queueOrderId.toString() },
      (err: BusinessError) => {
        if (err) {
          Logger.error(TAG, `Failed to publish orderId event. Code is ${err.code}, message is ${err.message}`);
        } else {
          Logger.info(TAG, 'Succeeded in publishing orderId event.');
        }
      });
  }

  // 订阅获取排号订单id
  public static async subscribeQueueId() {
    let subscriber: commonEventManager.CommonEventSubscriber;
    let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = { events: [WidgetUtil._queueIdEventName] };
    commonEventManager.createSubscriber(subscribeInfo, (orderIdErr1, orderData1) => {
      if (orderIdErr1) {
        Logger.error(TAG,
          `Failed to create orderId subscriber. Code is ${orderIdErr1.code}, message is ${orderIdErr1.message}`);
        return;
      }
      subscriber = orderData1;
      commonEventManager.subscribe(subscriber, (orderIdErr2, orderIdData2) => {
        if (orderIdErr2) {
          Logger.error(TAG,
            `Failed to subscribe orderId event. Code is ${orderIdErr2.code}, message is ${orderIdErr2.message}`);
          return;
        } else {
          cancelQueueOrderApi(Number(orderIdData2.data));
        }
      });
    });
  }

  public static updateWidgets(ctx: Context, order: QueueOrder) {
    WidgetUtil.getFormIds(ctx).forEach(id => {
      let formData: Record<string, QueueOrder> = { 'order': order };
      formProvider.updateForm(id, formBindingData.createFormBindingData(formData));
    });
    const store = WidgetUtil._getStore(ctx);
    store.putSync(WidgetUtil._queueOrderKey, order);
    store.flush();
  }

  public static resetWidgets(ctx: Context, orderId?: number) {
    if (orderId && orderId !== WidgetUtil.getQueueOrder(ctx).orderId) {
      return;
    }
    WidgetUtil.getFormIds(ctx).forEach(id => {
      const nullData: QueueOrder = {
        orderId: 0,
        count: 0,
        mine: 0,
        now: 0,
        wait: 0,
      };
      let formData: Record<string, QueueOrder> = { 'order': nullData };
      formProvider.updateForm(id, formBindingData.createFormBindingData(formData));
      const store = WidgetUtil._getStore(ctx);
      store.putSync(WidgetUtil._queueOrderKey, nullData);
      store.flush();
    });
  }

  private static _getStore(ctx: Context) {
    return preferences.getPreferencesSync(ctx, { name: WidgetUtil._fileName });
  }
}

export interface QueueOrder {
  orderId: number;
  count: number;
  mine: number;
  now: number;
  wait: number;
}