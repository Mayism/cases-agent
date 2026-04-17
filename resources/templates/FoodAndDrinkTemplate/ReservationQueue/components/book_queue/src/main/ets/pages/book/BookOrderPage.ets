import { BookOrderInfoCom } from '../../components/book/BookOrderInfoCom';
import { BookSpecialServiceCom } from '../../components/book/BookSpecialServiceCom';
import { CommonButton } from '../../components/common/CommonButton';
import { CommonPage } from '../../components/common/CommonPage';
import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { BookVM } from '../../viewmodels/BookVM';

@ComponentV2
export struct BookOrderPage {
  vm: BookVM = BookVM.instance;

  aboutToAppear(): void {
    this.vm.resetBookOrderParams();
  }

  build() {
    CommonPage({
      title: '立即预订',
      mainUi: () => {
        this.bookOrderMainUiBuilder();
      },
      bottomUi: () => {
        this.bookOrderBottomUiBuilder();
      },
    })
  }

  @Builder
  bookOrderMainUiBuilder() {
    /** 就餐信息 **/
    this.bookDinnerInfoBuilder()

    /** 基本信息 **/
    BookOrderInfoCom()

    /** 特殊需求 **/
    BookSpecialServiceCom()

    /** 备注信息 **/
    this.tipsBuilder()

    Blank().layoutWeight(1)
  }

  @Builder
  bookOrderBottomUiBuilder() {
    CommonButton({
      title: '立即预订',
      handleClick: async () => {
        await this.vm.createBookOrder();
      },
    })
  }

  @Builder
  bookDinnerInfoBuilder() {
    Column({ space: 12 }) {
      Text('就餐信息').whiteTextStyle(true).width(CommonConstants.FULL_WIDTH)
      List({ space: 25 }) {
        ListItem() {
          Row() {
            Image($r('app.media.ic_book_time')).width(24).fillColor($r('app.color.system_color_background_white'))
            Text('就餐时间').whiteTextStyle(false).layoutWeight(1).margin({ left: $r('app.string.margin_8') })
            Text(this.vm.timeStr).whiteTextStyle(true)
          }
        }

        ListItem() {
          Row() {
            Image($r('app.media.ic_book_people')).width(24).fillColor($r('app.color.system_color_background_white'))
            Text('就餐人数').whiteTextStyle(false).layoutWeight(1).margin({ left: $r('app.string.margin_8') })
            Text(`${this.vm.headCount}人 ${this.vm.isPrivateRoom ? '包间' : '大厅'}`).whiteTextStyle(true)
          }
        }
      }
      .divider({ strokeWidth: 1, color: $r('sys.color.interactive_click') })
    }
    .linearGradient({ angle: 180, colors: [['#DD4737', 0], ['#FA7A57', 1]] })
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  tipsBuilder() {
    Column({ space: 8 }) {
      Text('备注').titleTextStyle()
      TextArea({ text: $$this.vm.tips })
        .maxLength(100)
        .showCounter(true)
        .width(CommonConstants.FULL_WIDTH)
        .height(56)
        .borderRadius($r('app.string.border_radius_8'))
        .backgroundColor($r('app.color.system_color_background_gray'))
    }
    .attributeModifier(CONTAINER_STYLE)
  }
}

@Extend(Text)
function titleTextStyle() {
  .height(20)
  .fontSize($r('sys.float.Body_M'))
  .fontColor($r('sys.color.font_primary'))
  .fontWeight(FontWeight.Medium)
  .width(CommonConstants.FULL_WIDTH)
}

@Extend(Text)
function whiteTextStyle(isMedium: boolean) {
  .lineHeight(19)
  .fontSize($r('sys.float.Body_M'))
  .fontColor($r('app.color.system_color_background_white'))
  .fontWeight(isMedium ? FontWeight.Medium : FontWeight.Regular)
}

@Builder
export function bookOrderPageBuilder() {
  BookOrderPage()
}