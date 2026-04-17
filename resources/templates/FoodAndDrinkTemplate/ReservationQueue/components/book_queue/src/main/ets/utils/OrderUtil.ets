import { preferences } from '@kit.ArkData';
import { BookOrderDetail, QueueOrderDetail } from '../network/types/ResponseTypes';
import { BookOrderModel } from '../types/Types';

export class OrderUtil {
  private static _ctx: Context = getContext();
  private static readonly _fileName: string = 'order_file';
  private static readonly _bookOrderKey: string = 'book_order_key';
  private static readonly _queueOrderKey: string = 'queue_order_key';

  public static setContext(ctx: Context) {
    OrderUtil._ctx = ctx;
  }

  public static getBookOrders(ctx: Context) {
    const store = OrderUtil._getStore(ctx);
    return store.getSync(OrderUtil._bookOrderKey, []) as BookOrderModel[];
  }

  public static getBookOrderById(ctx: Context, orderId: number) {
    const list = OrderUtil.getBookOrders(ctx);
    return list.find(order => order.orderId === orderId);
  }

  public static async addBookOrder(ctx: Context, order: BookOrderDetail) {
    const list = OrderUtil.getBookOrders(ctx);
    if (!list.some(item => item.orderId === order.orderId)) {
      list.unshift({
        schedule: false,
        orderId: order.orderId,
        store: order.store,
        time: order.time,
        count: order.count,
        room: order.room,
        name: order.name,
        gender: order.gender,
        phone: order.phone,
        decoration: order.decoration,
        tableWares: order.tableWares,
        tips: order.tips,
      });
      const store = OrderUtil._getStore(ctx);
      store.putSync(OrderUtil._bookOrderKey, list);
      await store.flush();
    }
  }

  public static async delBookOrder(ctx: Context, orderId: number) {
    const list = OrderUtil.getBookOrders(ctx);
    const index = list.findIndex(order => order.orderId === orderId);
    if (index !== -1) {
      list.splice(index, 1);
      const store = OrderUtil._getStore(ctx);
      store.putSync(OrderUtil._bookOrderKey, list);
      await store.flush();
    }
  }

  public static checkHasSchedule(ctx: Context, orderId: number) {
    const index = OrderUtil.getBookOrders(ctx).findIndex(order => order.orderId === orderId);
    if (index !== -1) {
      return OrderUtil.getBookOrders(ctx)[index].schedule;
    }
    return false;
  }

  public static async updateSchedule(ctx: Context, orderId: number) {
    const list = OrderUtil.getBookOrders(ctx);
    const index = list.findIndex(order => order.orderId === orderId);
    if (index !== -1) {
      list[index].schedule = true;
      const store = OrderUtil._getStore(ctx);
      store.putSync(OrderUtil._bookOrderKey, list);
      await store.flush();
    }
  }

  public static getQueueOrders(ctx: Context) {
    const store = OrderUtil._getStore(ctx);
    return store.getSync(OrderUtil._queueOrderKey, []) as QueueOrderDetail[];
  }

  public static getQueueOrderById(ctx: Context, orderId: number) {
    const list = OrderUtil.getQueueOrders(ctx);
    return list.find(order => order.orderId === orderId);
  }

  public static async addQueueOrder(ctx: Context, order: QueueOrderDetail) {
    const list = OrderUtil.getQueueOrders(ctx);
    if (!list.some(item => item.orderId === order.orderId)) {
      list.unshift(order);
      const store = OrderUtil._getStore(ctx);
      store.putSync(OrderUtil._queueOrderKey, list);
      await store.flush();
    }
  }

  public static async delQueueOrder(ctx: Context, orderId: number) {
    const list = OrderUtil.getQueueOrders(ctx ?? OrderUtil._ctx);
    const index = list.findIndex(order => order.orderId === orderId);
    if (index !== -1) {
      list.splice(index, 1);
      const store = OrderUtil._getStore(ctx ?? OrderUtil._ctx);
      store.putSync(OrderUtil._queueOrderKey, list);
      await store.flush();
    }
  }

  public static async refreshQueueOrder(ctx: Context, orderId: number) {
    const list = OrderUtil.getQueueOrders(ctx);
    const index = list.findIndex(order => order.orderId === orderId);
    if (index !== -1) {
      const order = list[index];
      order.now += 1;
      order.wait -= 1;
      const store = OrderUtil._getStore(ctx);
      store.putSync(OrderUtil._queueOrderKey, list);
      await store.flush();
      return order;
    }
    return undefined;
  }

  public static checkHasQueue(ctx: Context, storeId: number) {
    const index =
      OrderUtil.getQueueOrders(ctx).findIndex(order => order.store.storeId === storeId && order.wait >= 0);
    if (index !== -1) {
      return true;
    }
    return false;
  }

  private static _getStore(ctx: Context) {
    return preferences.getPreferencesSync(ctx, { name: OrderUtil._fileName });
  }
}