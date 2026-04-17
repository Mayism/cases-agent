import { cancelBookOrderApi, cancelQueueOrderApi, getOrderListApi } from '../network/apis/ApiList';
import { BookOrderDetail, QueueOrderDetail } from '../network/types/ResponseTypes';
import { alertToConfirm } from '../utils/AlertUtil';
import { WidgetUtil } from '../utils/WidgetUtil';

@ObservedV2
export class OrderVM {
  // 初次加载
  @Trace init: boolean = true;
  // 当前索引
  @Trace index: number = 0;
  // 订座订单列表
  @Trace bookList: BookOrderDetail[] = [];
  // 排号订单列表
  @Trace queueList: QueueOrderDetail[] = [];
  private static _instance: OrderVM;

  public static get instance() {
    if (!OrderVM._instance) {
      OrderVM._instance = new OrderVM();
    }
    return OrderVM._instance;
  }

  // 获取所有订单
  public async getAllOrders() {
    const res = await getOrderListApi();
    if (res.status === 200) {
      this.bookList = [...res.data.book];
      this.queueList = res.data.queue.filter(order => order.wait >= 0);
      this.init = false;
    }
  }

  // 取消订座订单
  public async cancelBookOrder(orderId: number) {
    alertToConfirm('取消订座订单后将无法恢复，是否取消？', async () => {
      const res = await cancelBookOrderApi(orderId);
      if (res.status === 200) {
        const index = this.bookList.findIndex(order => order.orderId === orderId);
        if (index !== -1) {
          this.bookList.splice(index, 1);
        }
      }
    });
  }

  // 取消排号订单
  public async cancelQueueOrder(orderId: number) {
    alertToConfirm('取消排号订单后将无法恢复，是否取消？', async () => {
      const res = await cancelQueueOrderApi(orderId);
      if (res.status === 200) {
        const index = this.queueList.findIndex(order => order.orderId === orderId);
        if (index !== -1) {
          this.queueList.splice(index, 1);
          WidgetUtil.resetWidgets(getContext(), orderId);
        }
      }
    });
  }
}
