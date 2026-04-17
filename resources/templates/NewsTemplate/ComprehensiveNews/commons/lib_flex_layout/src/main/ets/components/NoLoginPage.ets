import { LoginSheetUtils } from 'lib_account'
import { CommonConstants } from 'lib_common'

@ComponentV2
export struct NoLoginPage {
  build() {
    Column({ space: CommonConstants.SPACE_L }) {
      Column() {
        Image($r('app.media.no_login'))
          .width(120)
          .height(120)
        Text('暂未登录，登录后查看更多精彩内容')
          .fontColor($r('sys.color.font_tertiary'))
          .fontSize($r('sys.float.Body_M'))
      }

      Column() {
        Button('登录')
          .padding({
            top: CommonConstants.PADDING_S,
            bottom: CommonConstants.PADDING_S,
            left: CommonConstants.PADDING_XXL,
            right: CommonConstants.PADDING_XXL,
          })
          .borderRadius(20)
      }
      .onClick(() => {
        LoginSheetUtils.open()
      })
    }
  }
}