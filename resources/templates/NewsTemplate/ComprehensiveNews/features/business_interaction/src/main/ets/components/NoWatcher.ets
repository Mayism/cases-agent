import { CommonConstants } from 'lib_common'

@ComponentV2
export struct NoWatcher {
  build() {
    Column({ space: 12 }) {
      Image($r('app.media.no_watch'))
        .width(92)
        .height(77)
      Text('暂无关注')
        .fontSize(14)
        .fontColor($r('sys.color.font_secondary'))
    }
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Center)
  }
}