import { RouterMap } from '../constants/Common';
import { CHOOSE_NUM, WEEK_DAYS } from '../constants/Constants';
import {
  cancelQueueOrderApi,
  createQueueOrderApi,
  getQueueStoreListApi,
  refreshQueueOrderApi,
} from '../network/apis/ApiList';
import { QueueOrderData } from '../network/types/RequestParams';
import { QueueOrderDetail, StoreInfo, StoreQueueInfo } from '../network/types/ResponseTypes';
import { Dialog } from '../utils/Dialog';
import { FullLoading } from '../utils/FullLoading';
import { RouterModule } from '../utils/RouterModule';
import { formatDateToMonthDay } from '../utils/Format';
import { QueueOrder, WidgetUtil } from '../utils/WidgetUtil';
import { promptAction } from '@kit.ArkUI';
import { OrderUtil } from '../utils/OrderUtil';
import { alertToConfirm } from '../utils/AlertUtil';

@ObservedV2
export class QueueVM {
  // 搜索中
  @Trace searching: boolean = false;
  // 搜索门店文字
  @Trace query: string = '';
  // 门店列表
  @Trace storeList: StoreInfo[] = [];

  // 搜索门店列表
  @Computed
  public get searchStoreList() {
    if (!this.query.trim()) {
      return this.storeList;
    }
    return this.storeList.filter(item => item.name.includes(this.query.trim()));
  }

  // 当前时间字符串
  @Trace timeStr: string = '';
  // 当前时间日期对象
  @Trace timeDate: Date = new Date();
  // 订单排号时间
  @Trace orderTimeStr: string = '';
  // 选中门店
  @Trace storeSelected: StoreInfo | undefined;
  // 就餐人数
  @Trace headCount: number = 0;

  // 座位类型
  @Computed
  public get type() {
    if (this.headCount <= 3) {
      return '小桌';
    } else if (this.headCount <= 6) {
      return '中桌';
    } else {
      return '大桌';
    }
  }

  // 显示选择人数半模态
  @Trace showCount: boolean = false;
  public countRange: string[] = CHOOSE_NUM.map(num => num + '人');
  // 人数选择器选中索引
  @Trace tempCountIndex: number = 0;
  // 店铺排号信息
  @Trace storeQueueInfo: StoreQueueInfo | undefined;
  @Trace deskInfo: string = '';
  // 排号结果订单
  @Trace order: QueueOrderDetail | undefined;
  private static _instance: QueueVM;

  public static get instance() {
    if (!QueueVM._instance) {
      QueueVM._instance = new QueueVM();
    }
    return QueueVM._instance;
  }

  @Monitor('timeDate', 'headCount')
  private _conditionChange() {
    this.getQueueStoreList();
  }

  // 重置排号参数
  public resetQueueParams() {
    this.query = '';
    this.timeDate = new Date();
    this.timeStr = formatDateToMonthDay(new Date()) + ' ' + WEEK_DAYS[this.timeDate.getDay()] + '(今天)';
    this.tempCountIndex = 2;
    this.headCount = CHOOSE_NUM[this.tempCountIndex];
  }

  // 重置排号订单参数
  public resetQueueOrderParams() {
    const now = new Date();
    this.orderTimeStr = formatDateToMonthDay(now) + ' ' +
    now.getHours().toString().padStart(2, '0') + ':' + now.getMinutes().toString().padStart(2, '0');
    this.storeQueueInfo = undefined;
  }

  // 获取排号门店
  public async getQueueStoreList() {
    this.searching = true;
    const res = await getQueueStoreListApi(this.headCount);
    if (res.status === 200) {
      this.storeList = res.data;
      this.searching = false;
    }
  }

  // 获取排号门店叫号信息
  public getQueueStoreInfo() {
    this.storeQueueInfo = this.storeSelected?.queueInfo;
    if (!this.storeQueueInfo) {
      return;
    }
    this.deskInfo =
      '小桌-' + this.storeQueueInfo.min + '; 中桌-' + this.storeQueueInfo.mid + '; 大桌-' + this.storeQueueInfo.max;
  }

  // 跳转排号预订
  public jumpToQueueOrder(store: StoreInfo) {
    if (!store.needQueue) {
      Dialog.open();
      return;
    }
    if (OrderUtil.checkHasQueue(getContext(), store.storeId)) {
      promptAction.showToast({ message: '当前门店已存在排号订单' });
      return;
    }
    this.storeSelected = store;
    RouterModule.push({ url: RouterMap.QUEUE_ORDER_PAGE });
  }


  // 创建排号订单
  public async createQueueOrder() {
    FullLoading.show();
    const data: QueueOrderData = {
      store: this.storeSelected!,
      count: this.headCount,
    };
    const res = await createQueueOrderApi(data);
    if (res.status === 200) {
      RouterModule.replace({ url: RouterMap.QUEUE_RES_PAGE, param: res.data.orderId });
      WidgetUtil.updateWidgets(getContext(), res.data as QueueOrder);
      FullLoading.hide();
    }
  }

  // 取消排号订单
  public async cancelQueueOrder(orderId: number) {
    alertToConfirm('取消排号订单后将无法恢复，是否取消？', async () => {
      const res = await cancelQueueOrderApi(orderId);
      if (res.status === 200) {
        WidgetUtil.resetWidgets(getContext(), orderId);
        RouterModule.pop();
      }
    });
  }

  // 刷新排号订单
  public async refreshQueueOrder() {
    FullLoading.show();
    const res = await refreshQueueOrderApi(this.order!.orderId);
    FullLoading.hide();
    if (res.status === 200) {
      if (res.data === undefined) {
        promptAction.showToast({ message: '排号不存在' });
        WidgetUtil.resetWidgets(getContext());
        RouterModule.pop();
      } else if (res.data.wait < 0) {
        promptAction.showToast({ message: '排号已过期' });
        WidgetUtil.updateWidgets(getContext(), res.data as QueueOrder);
        RouterModule.pop();
      } else {
        this.order = res.data;
        WidgetUtil.updateWidgets(getContext(), res.data as QueueOrder);
      }
    }
  }
}
