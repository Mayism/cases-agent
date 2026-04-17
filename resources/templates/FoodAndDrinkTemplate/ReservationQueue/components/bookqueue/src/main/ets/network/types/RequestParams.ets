import { StoreInfo } from './ResponseTypes';

export interface StoreParams {
  storeId: number;
}

export interface BookStoreParams {
  // 0-0:00~8:59, 1-9:00~15:59, 2-16:00~21:59, 3-22:00~23:59
  period: number;
  max: number;
  isPrivate: boolean;
}

export interface QueueStoreParams {
  max: number;
}

export interface BookOrderData {
  store: StoreInfo;
  time: string;
  count: number;
  room: boolean;
  name: string;
  gender: number; // 1-先生 ; 2-女士
  phone: string;
  decoration?: string;
  tableWares?: string[];
  tips?: string;
}

export interface CancelBookOrderDate {
  orderId: number;
}

export interface QueueOrderData {
  store: StoreInfo;
  count: number;
}

export interface CancelQueueOrderDate {
  orderId: number;
}

export interface RefreshQueueOrderParams {
  orderId: number;
}