import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { GenderStatus } from '../../types/Types';
import { BookVM } from '../../viewmodels/BookVM';

@ComponentV2
export struct BookOrderInfoCom {
  vm: BookVM = BookVM.instance;

  build() {
    Column({ space: 12 }) {
      Text('基本信息').titleTextStyle()
      List({ space: 25 }) {
        ListItem() {
          Row() {
            Image($r('app.media.ic_book_order_people')).width(24)
            Text('订座人').descTextStyle()
            TextInput({ text: $$this.vm.name, placeholder: '请输入您的姓名' })
              .maxLength(10)
              .textInputStyle()
              .type(InputType.USER_NAME)
          }
        }

        ListItem() {
          Row() {
            Image($r('app.media.ic_book_order_gender')).width(24)
            Text('性别').descTextStyle()
            Blank().layoutWeight(1)
            Row({ space: 16 }) {
              this.genderBtnBuilder(GenderStatus.MALE)
              this.genderBtnBuilder(GenderStatus.FEMALE)
            }
          }
        }

        ListItem() {
          Row() {
            Image($r('app.media.ic_book_order_phone')).width(24)
            Text('联系方式').descTextStyle()
            TextInput({ text: $$this.vm.phone, placeholder: '请输入您的联系方式' })
              .textInputStyle()
              .type(InputType.PhoneNumber)
          }
        }
      }
      .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
    }
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  genderBtnBuilder(gender: GenderStatus) {
    Row({ space: 2 }) {
      Image(gender === GenderStatus.MALE ? $r('app.media.ic_book_order_male') : $r('app.media.ic_book_order_female'))
        .width(16)
        .fillColor(gender === this.vm.gender ? $r('app.color.system_color_background_white') :
        $r('sys.color.font_primary'))
      Text(gender === GenderStatus.MALE ? '先生' : '女士')
        .fontSize(10)
        .fontColor(gender === this.vm.gender ? $r('app.color.system_color_background_white') :
        $r('sys.color.font_primary'))
    }
    .onClick(() => {
      this.vm.gender = gender;
    })
    .backgroundColor(gender === this.vm.gender ? $r('app.color.brand_red') : $r('sys.color.interactive_click'))
    .borderRadius($r('app.string.border_radius_8'))
    .padding({
      left: 8,
      right: 8,
      top: 3,
      bottom: 3,
    })
  }
}

@Extend(Text)
function titleTextStyle() {
  .lineHeight(19)
  .fontSize($r('sys.float.Body_M'))
  .fontColor($r('sys.color.font_primary'))
  .fontWeight(FontWeight.Medium)
  .width(CommonConstants.FULL_WIDTH)
}

@Extend(Text)
function descTextStyle() {
  .fontSize(14)
  .fontColor($r('sys.color.font_secondary'))
  .margin({ left: $r('app.string.margin_8') })
}

@Extend(TextInput)
function textInputStyle() {
  .padding({
    left: 0,
    right: 2,
    top: 0,
    bottom: 0,
  })
  .layoutWeight(1)
  .textAlign(TextAlign.End)
  .backgroundColor(Color.Transparent)
  .placeholderColor($r('sys.color.font_secondary'))
  .placeholderFont({
    weight: FontWeight.Regular,
    size: $r('sys.float.Body_M'),
  })
  .fontWeight(FontWeight.Regular)
  .fontColor($r('sys.color.font_primary'))
  .fontSize(14)
}
