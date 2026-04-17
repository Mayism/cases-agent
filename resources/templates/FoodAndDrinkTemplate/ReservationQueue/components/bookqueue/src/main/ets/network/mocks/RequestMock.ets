import { AxiosRequestConfig, HttpStatusCode } from '@ohos/axios';
import { OrderUtil } from '../../utils/OrderUtil';
import { axiosInstance } from '../apis/HttpRequest';
import {
  BookOrderData,
  BookStoreParams,
  CancelBookOrderDate,
  CancelQueueOrderDate,
  QueueOrderData,
  QueueStoreParams,
  RefreshQueueOrderParams,
} from '../types/RequestParams';
import { RequestUrl } from '../types/RequestUrl';
import { BookOrderDetail, OrderLists, QueueOrderDetail } from '../types/ResponseTypes';
import { AxiosMock } from './AxiosMock';
import { STORE_BOOK_LIST } from './mockdata/StoreInfo';

/**
 * Axios实例一致,则拦截;
 * Axios实例不一致,则不影响.
 */
const mock: AxiosMock = new AxiosMock(axiosInstance, {
  delayResponse: 800,
});

// 订座门店列表获取
mock.onGet(RequestUrl.URL_STORE_BOOK_LIST).reply(async (config: AxiosRequestConfig) => {
  const params = config.params as BookStoreParams;
  let list = STORE_BOOK_LIST.filter(store => store.maxCount >= params.max);
  if (params.isPrivate) {
    list = list.filter(store => store.privateRoom[params.period]);
  } else {
    list = list.filter(store => store.diningHall[params.period]);
  }
  return {
    status: HttpStatusCode.Ok,
    data: list,
  };
});

// 排号门店列表获取
mock.onGet(RequestUrl.URL_STORE_QUEUE_LIST).reply(async (config: AxiosRequestConfig) => {
  const params = config.params as QueueStoreParams;
  let list = STORE_BOOK_LIST.filter(store => store.maxCount >= params.max);
  return {
    status: HttpStatusCode.Ok,
    data: list,
  };
});

// 创建订座订单
mock.onPost(RequestUrl.URL_ORDER_BOOK_CREATE).reply(async (config: AxiosRequestConfig) => {
  const data = JSON.parse(config.data) as BookOrderData;
  const orderNew: BookOrderDetail = {
    orderId: Date.now(),
    store: data.store,
    time: data.time,
    count: data.count,
    room: data.room,
    name: data.name,
    gender: data.gender,
    phone: data.phone,
    decoration: data.decoration ?? '',
    tableWares: data.tableWares ?? [],
    tips: data.tips ?? '',
  };
  OrderUtil.addBookOrder(getContext(), orderNew);
  return {
    status: HttpStatusCode.Ok,
    data: orderNew,
  };
});

// 取消订座订单
mock.onPost(RequestUrl.URL_ORDER_BOOK_CANCEL).reply(async (config: AxiosRequestConfig) => {
  const data = JSON.parse(config.data) as CancelBookOrderDate;
  OrderUtil.delBookOrder(getContext(), data.orderId);
  return {
    status: HttpStatusCode.Ok,
  };
});

// 创建排号订单
mock.onPost(RequestUrl.URL_ORDER_QUEUE_CREATE).reply(async (config: AxiosRequestConfig) => {
  const data = JSON.parse(config.data) as QueueOrderData;
  const today = new Date();
  const month = today.getMonth() + 1;
  const day = today.getDate();
  const time = `${month}月${day}日` + ' ' +
  today.getHours().toString().padStart(2, '0') + ':' + today.getMinutes().toString().padStart(2, '0');
  const orderNew: QueueOrderDetail = {
    orderId: Date.now(),
    store: data.store,
    time: time,
    count: data.count,
    mine: 4,
    now: 1,
    wait: 3,
  };
  OrderUtil.addQueueOrder(getContext(), orderNew);
  return {
    status: HttpStatusCode.Ok,
    data: orderNew,
  };
});

// 取消排号订单
mock.onPost(RequestUrl.URL_ORDER_QUEUE_CANCEL).reply(async (config: AxiosRequestConfig) => {
  const data = JSON.parse(config.data) as CancelQueueOrderDate;
  OrderUtil.delQueueOrder(getContext(), data.orderId);
  return {
    status: HttpStatusCode.Ok,
  };
});

// 刷新排号订单
mock.onGet(RequestUrl.URL_ORDER_QUEUE_REFRESH).reply(async (config: AxiosRequestConfig) => {
  const params = config.params as RefreshQueueOrderParams;
  const res = await OrderUtil.refreshQueueOrder(getContext(), params.orderId);
  return {
    status: HttpStatusCode.Ok,
    data: res,
  };
});

// 获取我的订单
mock.onGet(RequestUrl.URL_ORDER_LIST).reply(async () => {
  const data: OrderLists = {
    book: OrderUtil.getBookOrders(getContext()),
    queue: OrderUtil.getQueueOrders(getContext()),
  };
  return {
    status: HttpStatusCode.Ok,
    data: data,
  };
});