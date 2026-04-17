import { CommonConstants } from '../../constants/Common';

@ComponentV2
export struct CommonSheet {
  @Param title: string = '标题';
  @BuilderParam ui?: () => void;
  @Event cancel?: () => void;
  @Event confirm?: () => void;

  build() {
    Column({ space: 22 }) {
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width(CommonConstants.FULL_WIDTH)
        .fontColor($r('sys.color.font_primary'))

      this.ui?.()

      Row({ space: 12 }) {
        Button('取消')
          .layoutWeight(1)
          .backgroundColor($r('app.color.btn_gray'))
          .fontColor($r('sys.color.font_primary'))
          .onClick(() => {
            this.cancel?.();
          })
        Button('确定')
          .layoutWeight(1)
          .backgroundColor($r('app.color.brand_red'))
          .fontColor($r('sys.color.font_on_primary'))
          .onClick(() => {
            this.confirm?.();
          })
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .padding({
      top: 32,
      bottom: 32,
      left: 16,
      right: 16,
    })
  }
}