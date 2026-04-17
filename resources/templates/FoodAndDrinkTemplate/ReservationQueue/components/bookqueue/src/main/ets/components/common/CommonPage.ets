import { CommonConstants } from '../../constants/Common';
import { WindowUtil } from '../../utils/WindowUtil';
import { CommonHeader } from './CommonHeader';

@ComponentV2
export struct CommonPage {
  @Param title: string = '标题';
  @BuilderParam topUi?: () => void;
  @BuilderParam mainUi?: () => void;
  @BuilderParam bottomUi?: () => void;
  @Event onShow?: () => void;

  build() {
    NavDestination() {
      Column() {
        /** 标题栏 **/
        CommonHeader({ title: this.title })

        this.topUi?.()

        Scroll() {
          Column({ space: 12 }) {
            this.mainUi?.()
          }.justifyContent(FlexAlign.Start)
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .width('calc(100% - 32vp)')
        .padding({ bottom: $r('app.string.padding_6') })

        this.bottomUi?.()
      }
      .backgroundColor($r('app.color.system_color_background_gray'))
    }
    .hideTitleBar(true)
    .padding({ top: WindowUtil.getAvoidArea().top, bottom: WindowUtil.getAvoidArea().bottom })
    .backgroundColor(WindowUtil.fullScreen ? $r('app.color.system_color_background_gray') : undefined)
    .height(CommonConstants.FULL_HEIGHT)
    .onShown(() => {
      this.onShow?.();
    })
  }
}