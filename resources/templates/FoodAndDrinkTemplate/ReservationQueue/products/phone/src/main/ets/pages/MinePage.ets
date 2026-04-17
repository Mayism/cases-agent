import { CommonHeader } from '../components/CommonHeader';
import { HeadPart } from '../components/mine/HeaderPart';
import { Settings } from '../components/mine/Settings';
import { CommonConstants } from '../constants/CommonContants';
import { MineVM } from '../viewmodels/MineVM';

@ComponentV2
export struct MinePage {
  vm: MineVM = MineVM.instance;

  build() {
    Column() {
      /** 标题栏 **/
      CommonHeader({ title: '我的', showBackButton: false })

      Scroll() {
        Column({ space: 12 }) {
          /** 顶部信息 **/
          HeadPart()

          /** 更多设置 **/
          Settings()

          Blank().layoutWeight(1)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .width('calc(100% - 32vp)')
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.system_color_background_gray'))
  }
}

@Builder
export function minePageBuilder() {
  MinePage()
}