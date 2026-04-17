import { CommonConstants } from '../constants/CommonContants';
import { WindowUtil } from '../utils/WindowUtil';

@ComponentV2
export struct CommonHeader {
  @Param title: string = '标题';
  @Param backAnimation: boolean = true;
  @Param showBackButton: boolean = true;
  @Consumer('stack') stack: NavPathStack = new NavPathStack();

  build() {
    Row() {
      if (this.showBackButton) {
        Row() {
          Image($r('app.media.ic_back')).width(HeaderStyle.ICON_SIZE_INNER)
        }
        .aspectRatio(1)
        .justifyContent(FlexAlign.Center)
        .width(HeaderStyle.ICON_SIZE_OUTER)
        .margin({ right: HeaderStyle.MARGIN })
        .backgroundColor(HeaderStyle.ICON_BG_COLOR)
        .borderRadius('50%')
        .onClick(() => {
          this.stack.pop(this.backAnimation);
        })
      }
      Text(this.title)
        .fontWeight(this.showBackButton ? FontWeight.Bold : FontWeight.Medium)
        .fontSize(this.showBackButton ? $r('sys.float.Title_S') : $r('sys.float.Title_M'))
        .fontColor(HeaderStyle.FONT_COLOR)
        .padding({ left: this.showBackButton ? 0 : 8 })
    }
    .height(HeaderStyle.HEIGHT)
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Start)
    .backgroundColor(Color.Transparent)
    .padding({ left: HeaderStyle.PADDING })
    .margin({ bottom: 12, top: WindowUtil.getAvoidArea().top })
  }
}

export class HeaderStyle {
  static readonly ICON_SIZE_INNER: Length = 24;
  static readonly ICON_SIZE_OUTER: Length = 40;
  static readonly ICON_BG_COLOR: Length = $r('sys.color.comp_background_tertiary');
  static readonly FONT_COLOR: ResourceStr = $r('sys.color.font_primary');
  static readonly HEIGHT: number = 56;
  static readonly PADDING: Length = 16;
  static readonly MARGIN: Length = 8;
}