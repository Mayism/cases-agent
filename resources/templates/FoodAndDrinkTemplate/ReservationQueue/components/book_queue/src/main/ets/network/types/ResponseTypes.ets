export interface StoreInfo {
  storeId: number;
  name: string;
  distance: number;
  location: string;

  // [0:00~8:59, 9:00~15:59, 16:00~21:59, 22:00~23:59]
  privateRoom: number[];
  diningHall: number[];
  maxCount: number;
  needQueue: boolean;
  queueInfo: StoreQueueInfo;
}

export interface StoreQueueInfo {
  used: number;
  min: number;
  mid: number;
  max: number;
  now: string;
}

export interface BookOrderDetail {
  orderId: number;
  store: StoreInfo;
  time: string;
  count: number;
  room: boolean;
  name: string;
  gender: number; // 1-先生 ; 2-女士
  phone: string;
  decoration: string;
  tableWares: string[];
  tips: string;
}

export interface QueueOrderDetail {
  orderId: number;
  store: StoreInfo;
  time: string;
  count: number;
  mine: number;
  now: number;
  wait: number;
}

export interface OrderLists {
  book: BookOrderDetail[];
  queue: QueueOrderDetail[];
}
