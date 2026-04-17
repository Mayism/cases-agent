import { CommonConstants } from '../../constants/Common';

@ComponentV2
export struct CommonBanner {
  build() {
    Column({ space: 12 }) {
      Text('订桌不用现场等待').titleBannerStyle()
      Text('        提前取号避免排队').titleBannerStyle()
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .width(CommonConstants.FULL_WIDTH)
    .borderRadius($r('app.string.border_radius_16'))
    .backgroundImage($r('app.media.ic_book_banner'))
    .backgroundImageSize(ImageSize.Cover)
    .padding({ left: $r('app.string.padding_16'), top: 37, bottom: 37 })
  }
}

@Extend(Text)
function titleBannerStyle() {
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
  .fontColor($r('app.color.system_color_background_white'))
}