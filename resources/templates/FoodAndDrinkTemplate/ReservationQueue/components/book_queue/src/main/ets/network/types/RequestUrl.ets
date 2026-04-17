export enum RequestUrl {
  /**
   * 门店相关
   */
  URL_STORE_BOOK_LIST = '/api/store/book/list',
  URL_STORE_QUEUE_LIST = '/api/store/queue/list',
    
  /**
   * 订单相关
   */
  URL_ORDER_LIST = '/api/order/book/list',
  URL_ORDER_BOOK_CREATE = '/api/order/book/create',
  URL_ORDER_BOOK_CANCEL = '/api/order/book/cancel',
  URL_ORDER_QUEUE_CREATE = '/api/order/queue/create',
  URL_ORDER_QUEUE_CANCEL = '/api/order/queue/cancel',
  URL_ORDER_QUEUE_REFRESH = '/api/order/queue/refresh',
}