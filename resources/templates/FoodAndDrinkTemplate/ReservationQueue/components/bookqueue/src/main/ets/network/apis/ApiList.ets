import { AxiosResponse } from '@ohos/axios';
import '../mocks/RequestMock';
import { RequestUrl } from '../types/RequestUrl';
import { axiosInstance } from './HttpRequest';
import {
  BookOrderData,
  BookStoreParams,
  CancelBookOrderDate,
  CancelQueueOrderDate,
  QueueOrderData,
  QueueStoreParams,
  RefreshQueueOrderParams,
} from '../types/RequestParams';
import { BookOrderDetail, OrderLists, QueueOrderDetail, StoreInfo } from '../types/ResponseTypes';

// 订座门店列表获取
export const getBookStoreListApi = (params: BookStoreParams): Promise<AxiosResponse<StoreInfo[], BookStoreParams>> => {
  return axiosInstance.get(RequestUrl.URL_STORE_BOOK_LIST, { params });
};

// 排号门店列表获取
export const getQueueStoreListApi = (count: number): Promise<AxiosResponse<StoreInfo[], QueueStoreParams>> => {
  const params: QueueStoreParams = { max: count };
  return axiosInstance.get(RequestUrl.URL_STORE_QUEUE_LIST, { params });
};

// 创建订座订单
export const createBookOrderApi = (data: BookOrderData): Promise<AxiosResponse<BookOrderDetail, BookOrderData>> => {
  return axiosInstance.post(RequestUrl.URL_ORDER_BOOK_CREATE, data);
};

// 取消订座订单
export const cancelBookOrderApi = (orderId: number): Promise<AxiosResponse<void, CancelBookOrderDate>> => {
  const data: CancelBookOrderDate = { orderId };
  return axiosInstance.post(RequestUrl.URL_ORDER_BOOK_CANCEL, data);
};

// 创建排号订单
export const createQueueOrderApi = (data: QueueOrderData): Promise<AxiosResponse<QueueOrderDetail, QueueOrderData>> => {
  return axiosInstance.post(RequestUrl.URL_ORDER_QUEUE_CREATE, data);
};

// 取消排号订单
export const cancelQueueOrderApi = (orderId: number): Promise<AxiosResponse<void, CancelQueueOrderDate>> => {
  const data: CancelQueueOrderDate = { orderId };
  return axiosInstance.post(RequestUrl.URL_ORDER_QUEUE_CANCEL, data);
};

// 刷新排号订单
export const refreshQueueOrderApi =
  (orderId: number): Promise<AxiosResponse<QueueOrderDetail | undefined, RefreshQueueOrderParams>> => {
    const params: RefreshQueueOrderParams = { orderId };
    return axiosInstance.get(RequestUrl.URL_ORDER_QUEUE_REFRESH, { params });
  };

// 获取我的订单
export const getOrderListApi = (): Promise<AxiosResponse<OrderLists, void>> => {
  return axiosInstance.get(RequestUrl.URL_ORDER_LIST);
};