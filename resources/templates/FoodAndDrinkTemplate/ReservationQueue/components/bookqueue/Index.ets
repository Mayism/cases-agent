import { UIContext } from '@kit.ArkUI';
import { RouterModule } from './src/main/ets/utils/RouterModule';
import { FullLoading } from './src/main/ets/utils/FullLoading';
import { WindowUtil } from './src/main/ets/utils/WindowUtil';

export class BookQueue {
  public static init(stack: NavPathStack, ctx: UIContext, fullScreen: boolean) {
    RouterModule.stack = stack;
    FullLoading.init(ctx);
    WindowUtil.initWindowUtil(fullScreen);
  }
}

export { RouterModule } from './src/main/ets/utils/RouterModule';

export { cancelQueueOrderApi } from './src/main/ets/network/apis/ApiList';

export { RouterMap as BookQueueRouterMap } from './src/main/ets/constants/Common';

export { WidgetUtil, QueueOrder } from './src/main/ets/utils/WidgetUtil';