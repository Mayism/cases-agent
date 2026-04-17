import { CommonConstants } from '../../constants/Common';

@ComponentV2
export struct CommonShow {
  @Param title: string = '';

  build() {
    Column({ space: 8 }) {
      Text(this.title)
        .padding({ left: 12 })
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.system_color_background_white'))
      Text('您的餐位由门店安排！')
        .padding({ left: 12 })
        .fontSize(14)
        .fontColor($r('app.color.system_color_background_white'))
    }
    .height(116)
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Start)
    .backgroundImage($r('app.media.ic_book_res_bg0'))
    .backgroundImageSize({ width: '100%', height: '100%' })
  }
}
