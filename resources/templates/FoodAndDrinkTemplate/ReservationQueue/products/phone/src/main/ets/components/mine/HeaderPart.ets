import { CommonConstants } from '../../constants/CommonContants';
import { RouterMap } from '../../constants/CommonEnum';
import { desensitizePhoneNumber } from '../../utils/TelUtil';
import { MineVM } from '../../viewmodels/MineVM';

@ComponentV2
export struct HeadPart {
  vm: MineVM = MineVM.instance;
  @Consumer('stack') stack: NavPathStack = new NavPathStack();

  build() {
    Row() {
      Row({ space: 12 }) {
        Image(this.vm.userInfo.avatar === '' ? $r('app.media.ic_avatar_outer') : this.vm.userInfo.avatar)
          .width(64)
          .borderRadius('50%')
          .clip(true)
        Column({ space: 8 }) {
          Text(this.vm.userInfo.nickname === '' ? '华为用户' : this.vm.userInfo.nickname)
            .fontWeight(FontWeight.Medium)
            .fontSize($r('sys.float.Subtitle_L'))
            .fontColor($r('sys.color.font_secondary'))

          Row({ space: 4 }) {
            Image($r('app.media.ic_phone')).width(16)
            Text(desensitizePhoneNumber(this.vm.userInfo.cellphone))
              .fontSize($r('sys.float.Caption_L'))
              .fontColor($r('sys.color.font_secondary'))
          }
        }.alignItems(HorizontalAlign.Start)
      }.onClick(() => {
        this.stack.pushPathByName(RouterMap.PROFILE_EDIT, null)
      })
    }
    .containerStyle()
    .alignItems(VerticalAlign.Top)
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Styles
  containerStyle() {
    .padding($r('app.string.padding_12'))
    .borderRadius($r('app.string.border_radius_16'))
    .backgroundColor($r('app.color.system_color_background_white'))
  }
}

class ButtonStyle {
  public static readonly buttonTextColorBound: ResourceStr = $r('app.color.btn_text_blue');
  public static readonly buttonTextColorUnbound: ResourceStr = $r('sys.color.font_primary');
  public static readonly buttonBgColorBound: ResourceStr = $r('app.color.btn_blue');
  public static readonly buttonBgColorUnbound: ResourceStr = $r('sys.color.comp_background_tertiary');
  public static readonly buttonTextSize: ResourceStr = $r('sys.float.Body_M');
  public static readonly buttonWidth: Length = 92;
  public static readonly buttonHeight: Length = 28;
}

