export interface NavRouterInfo<T = undefined> {
  url: string; // 跳转路由名
  mode?: NavDestinationMode; // NavDestination类型
  param?: T; // 传递参数
  onPop?: Callback<PopInfo>; // 回调事件
}