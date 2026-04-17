import { CHOOSE_NUM, CHOOSE_TIME } from '../constants/Constants';
import { GenderStatus } from '../types/Types';
import { formatDateToMonthDay, formatTimePikerToStr, formatTimeStrToDate } from '../utils/Format';
import { promptAction } from '@kit.ArkUI';
import { RouterModule } from '../utils/RouterModule';
import { RouterMap } from '../constants/Common';
import { FullLoading } from '../utils/FullLoading';
import { BookOrderDetail, StoreInfo } from '../network/types/ResponseTypes';
import { cancelBookOrderApi, createBookOrderApi, getBookStoreListApi } from '../network/apis/ApiList';
import { BookOrderData, BookStoreParams } from '../network/types/RequestParams';
import { alertToConfirm } from '../utils/AlertUtil';

@ObservedV2
export class BookVM {
  // 搜索中
  @Trace searching: boolean = false;
  // 搜索门店文字
  @Trace query: string = '';
  // 门店列表
  @Trace storeList: StoreInfo[] = [];

  // 搜索门店列表
  @Computed
  public get searchStoreList() {
    if (!this.query.trim) {
      return this.storeList;
    }
    return this.storeList.filter(item => item.name.includes(this.query.trim()));
  }

  // 选中门店
  @Trace storeSelected: StoreInfo | undefined;
  // 筛选索引
  @Trace filterIndexes: [number, number, number] = [0, 0, 0];
  // 当前时间列表
  @Trace dates: Date[] = [];
  // 时间选择列表
  @Trace datesRange: string[] = [];
  // 时间选择器选中索引
  @Trace tempDayIndex: number = 0;
  // 选中时间字符串
  @Trace timeStr: string = '';
  // 选中时间日期对象
  @Trace timeDate: Date = new Date();
  // 就餐时间段
  @Trace period: number = 3;
  //就餐人数
  @Trace headCount: number = 0;
  // 是否预定包间
  @Trace isPrivateRoom: boolean = false;
  // 显示选择时间半模态
  @Trace showTime: boolean = false;
  // 显示选择人数半模态
  @Trace showCount: boolean = false;
  public countRange: string[] = CHOOSE_NUM.map(num => num + '人');
  // 人数选择器选中索引
  @Trace tempCountIndex: number = 0;
  public timeRes: TimePickerResult = { hour: 0, minute: 0, second: 0 };
  // 姓名
  @Trace name: string = '';
  // 性别
  @Trace gender: GenderStatus = GenderStatus.UNDEFINED;
  // 电话
  @Trace phone: string = '';
  // 选中装饰类
  @Trace decoration: string = '';
  // 选中餐具类
  @Trace tableWares: string[] = [];
  // 备注
  @Trace tips: string = '';
  // 排号结果订单
  @Trace order: BookOrderDetail | undefined;
  private static _instance: BookVM;

  @Monitor('filterIndexes.0')
  private _countChange() {
    this.headCount = CHOOSE_NUM[this.filterIndexes[0]];
  }

  @Monitor('filterIndexes.1', 'filterIndexes.2')
  private _timeChange() {
    this.tempDayIndex = this.filterIndexes[1];
    const date = this.dates[this.filterIndexes[1]];
    const timePickerRes: TimePickerResult =
      this._getTimeIntervalMiddle(CHOOSE_TIME[this.filterIndexes[2]], this.filterIndexes[1] === 1);
    this.timeStr = formatDateToMonthDay(date) + ' ' + formatTimePikerToStr(timePickerRes);
    this.timeDate = formatTimeStrToDate(this.timeStr);
  }

  @Monitor('timeDate', 'headCount', 'isPrivateRoom')
  private _conditionChange(monitor: IMonitor) {
    if (monitor.dirty.includes('timeDate')) {
      this.period = this._getTimePeriod(this.timeDate);
    }
    this.getBookStoreList();
  }

  public static get instance() {
    if (!BookVM._instance) {
      BookVM._instance = new BookVM();
    }
    return BookVM._instance;
  }

  // 重置订座参数
  public resetBookParams() {
    this.query = '';
    this.filterIndexes = [2, 1, 3];
    this.period = this.filterIndexes[2];
    this.tempDayIndex = this.filterIndexes[1];
    this.tempCountIndex = this.filterIndexes[0];
    this.dates = this._getWeekFromToday();
    this.datesRange = this.dates.map((date, index) => formatDateToMonthDay(date, index === 0 ? 0 : undefined));
    const date = this.dates[this.filterIndexes[1]];
    const timePickerRes: TimePickerResult =
      this._getTimeIntervalMiddle(CHOOSE_TIME[this.filterIndexes[2]], this.filterIndexes[1] === 1);
    this.timeStr = formatDateToMonthDay(date) + ' ' + formatTimePikerToStr(timePickerRes);
    this.timeDate = formatTimeStrToDate(this.timeStr);
    this.period = this._getTimePeriod(this.timeDate);
    this.headCount = CHOOSE_NUM[this.filterIndexes[0]];
    this.isPrivateRoom = false;
  }

  // 重置订座订单参数
  public resetBookOrderParams() {
    this.name = '';
    this.gender = GenderStatus.UNDEFINED;
    this.phone = '';
    this.decoration = '';
    this.tableWares.length = 0;
    this.tips = '';
  }

  // 确定时间选择
  public confirmPickerTime() {
    const timeStrTemp =
      formatDateToMonthDay(this.dates[this.tempDayIndex]) + ' ' + formatTimePikerToStr(this.timeRes);
    const timeDateTemp = formatTimeStrToDate(timeStrTemp);
    if (timeDateTemp.getTime() < Date.now()) {
      promptAction.showToast({ message: '订座时间不能早于当前时间' });
      return;
    }
    this.timeStr = timeStrTemp;
    this.timeDate = timeDateTemp;
    this.showTime = false;
  }

  // 获取订座门店
  public async getBookStoreList() {
    this.searching = true;
    const params: BookStoreParams = {
      period: this.period,
      max: this.headCount,
      isPrivate: this.isPrivateRoom,
    };
    const res = await getBookStoreListApi(params);
    if (res.status === 200) {
      this.storeList = res.data;
      this.searching = false;
    }
  }

  // 跳转订座预订
  public jumpToBookOrder(store: StoreInfo) {
    const lefts: number[] = this.isPrivateRoom ? store.privateRoom : store.diningHall;
    if (lefts[this.period] === 0) {
      return;
    }
    this.storeSelected = store;
    RouterModule.push({ url: RouterMap.BOOK_ORDER_PAGE });
  }

  // 特殊需求选择
  public specialOpt(onlyOne: boolean, value: string) {
    if (onlyOne) {
      if (this.decoration === value) {
        this.decoration = '';
      } else {
        this.decoration = value;
      }
    } else {
      const index = this.tableWares.findIndex(item => item === value);
      if (index === -1) {
        this.tableWares.push(value);
      } else {
        this.tableWares.splice(index, 1);
      }
    }
  }

  // 创建订座订单
  public async createBookOrder() {
    if (this.name === '') {
      promptAction.showToast({ message: '姓名不能为空' });
      return;
    }
    if (this.gender === GenderStatus.UNDEFINED) {
      promptAction.showToast({ message: '性别不能为空' });
      return;
    }
    const regex = /^1(3\d|4[5-9]|5[0-35-9]|6[2567]|7[0-8]|8\d|9[0-35-9])\d{8}$/;
    if (!regex.test(this.phone)) {
      promptAction.showToast({ message: '电话号码格式错误' });
      return;
    }
    FullLoading.show();
    const data: BookOrderData = {
      store: this.storeSelected!,
      time: this.timeStr,
      count: this.headCount,
      room: this.isPrivateRoom,
      name: this.name,
      gender: this.gender,
      phone: this.phone,
      decoration: this.decoration,
      tableWares: this.tableWares,
      tips: this.tips,
    };
    const res = await createBookOrderApi(data);
    if (res.status === 200) {
      RouterModule.replace({ url: RouterMap.BOOK_RES_PAGE, param: res.data.orderId });
      FullLoading.hide();
    }
  }

  // 取消订座订单
  public async cancelBookOrder(orderId: number) {
    alertToConfirm('取消订座订单后将无法恢复，是否取消？', async () => {
      const res = await cancelBookOrderApi(orderId);
      if (res.status === 200) {
        RouterModule.pop();
      }
    })
  }

  private _getWeekFromToday(): Date[] {
    const dates: Date[] = [];
    for (let i = 0; i < 7; i++) {
      const date = new Date();
      date.setDate(date.getDate() + i);
      dates.push(date);
    }
    return dates;
  }

  private _getTimePeriod(date: Date): number {
    const hour = date.getHours();
    const minute = date.getMinutes();
    const currentTimeInMinutes = hour * 60 + minute;
    return CHOOSE_TIME.findIndex(period => {
      const startHour = Number(period[0].split(':')[0]);
      const startMinute = Number(period[0].split(':')[1]);
      const endHour = Number(period[1].split(':')[0]);
      const endMinute = Number(period[1].split(':')[1]);
      const startInMinutes = startHour * 60 + startMinute;
      const endInMinutes = endHour * 60 + endMinute;
      if (currentTimeInMinutes >= startInMinutes && currentTimeInMinutes <= endInMinutes) {
        return true;
      }
      return false;
    });
  }

  private _getTimeIntervalMiddle(interval: [string, string], today: boolean): TimePickerResult {
    const startParts = interval[0].split(':');
    const startHour = parseInt(startParts[0], 10);
    const startMinute = parseInt(startParts[1], 10);
    const startTotalSeconds = startHour * 3600 + startMinute * 60;

    const endParts = interval[1].split(':');
    const endHour = parseInt(endParts[0], 10);
    const endMinute = parseInt(endParts[1], 10);
    const endTotalSeconds = endHour * 3600 + endMinute * 60;

    const middleTotalSeconds = (startTotalSeconds + endTotalSeconds) / 2;
    const middleHour = Math.floor(middleTotalSeconds / 3600);
    const middleMinute = Math.floor(middleTotalSeconds % 3600 / 60);
    const middleSecond = Math.floor(middleTotalSeconds % 60);

    const now = new Date();
    const currentHour = now.getHours();
    const currentMinute = now.getMinutes();
    const currentSecond = now.getSeconds();
    const currentTotalSeconds = currentHour * 3600 + currentMinute * 60 + currentSecond;

    if (today || middleTotalSeconds >= currentTotalSeconds) {
      return { hour: middleHour, minute: middleMinute, second: middleSecond };
    } else {
      return { hour: currentHour, minute: currentMinute, second: currentSecond };
    }
  }
}
