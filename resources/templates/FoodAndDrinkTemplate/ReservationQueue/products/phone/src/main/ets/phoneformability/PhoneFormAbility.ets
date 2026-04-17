import { formBindingData, FormExtensionAbility, formInfo } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';
import { cancelQueueOrderApi, QueueOrder, WidgetUtil } from 'book_queue';
import { OrderUtil } from 'book_queue/src/main/ets/utils/OrderUtil';

export default class PhoneFormAbility extends FormExtensionAbility {
  public onAddForm(want: Want) {
    let formData: Record<string, QueueOrder> = { 'order': WidgetUtil.getQueueOrder(this.context) };
    let formId = want.parameters?.[formInfo.FormParam.IDENTITY_KEY] as string | undefined;
    if (formId) {
      WidgetUtil.addFormId(formId, this.context);
      WidgetUtil.publishFormId(formId, false);
    }
    return formBindingData.createFormBindingData(formData);
  }

  public onRemoveForm(formId: string) {
    WidgetUtil.delFormId(formId, this.context);
    WidgetUtil.publishFormId(formId, true);
  }

  public onFormEvent(formId: string, message: string): void {
    const params = JSON.parse(message) as Record<string, number>;
    const orderId = params.orderId as number;
    OrderUtil.setContext(this.context);
    cancelQueueOrderApi(orderId).then((res) => {
      if (res.status === 200) {
        WidgetUtil.resetWidgets(this.context);
        WidgetUtil.publishQueueId(orderId);
      }
    });
  }
}