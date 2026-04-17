import { CommonButton } from '../../components/common/CommonButton';
import { CommonListItem } from '../../components/common/CommonListItem';
import { CommonPage } from '../../components/common/CommonPage';
import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { QueueVM } from '../../viewmodels/QueueVM';

@ComponentV2
export struct QueueOrderPage {
  vm: QueueVM = QueueVM.instance;

  async aboutToAppear() {
    this.vm.resetQueueOrderParams();
    this.vm.getQueueStoreInfo();
  }

  build() {
    CommonPage({
      title: '立即排号',
      mainUi: () => {
        this.queueOrderMainUiBuilder();
      },
      bottomUi: () => {
        this.queueOrderBottomUiBuilder();
      },
    })
  }

  @Builder
  queueOrderMainUiBuilder() {
    /** 就餐信息 **/
    this.queueDinnerInfoBuilder()

    /** 排号说明 **/
    this.descBuilder()

    /** 当前排号 **/
    this.queueInfoBuilder();

    Blank().layoutWeight(1)
  }

  @Builder
  queueOrderBottomUiBuilder() {
    CommonButton({
      title: '立即排号',
      handleClick: async () => {
        await this.vm.createQueueOrder();
      },
    })
  }

  @Builder
  queueDinnerInfoBuilder() {
    Column({ space: 12 }) {
      Text('就餐信息').whiteTextStyle(true).width(CommonConstants.FULL_WIDTH)
      List({ space: 25 }) {
        ListItem() {
          Row() {
            Image($r('app.media.ic_book_time')).height(24).fillColor($r('app.color.system_color_background_white'))
            Text('就餐时间').whiteTextStyle(false).layoutWeight(1).margin({ left: $r('app.string.margin_8') })
            Text(this.vm.orderTimeStr).whiteTextStyle(true)
          }
        }

        ListItem() {
          Row() {
            Image($r('app.media.ic_book_people')).width(24).fillColor($r('app.color.system_color_background_white'))
            Text('就餐人数').whiteTextStyle(false).layoutWeight(1).margin({ left: $r('app.string.margin_8') })
            Text(`${this.vm.headCount}人`).whiteTextStyle(true)
          }
        }
      }
      .divider({ strokeWidth: 1, color: $r('sys.color.interactive_click') })
    }
    .linearGradient({ angle: -180, colors: [['#DD4737', 0], ['#FA7A57', 1]] })
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  descBuilder() {
    Column({ space: 12 }) {
      Row() {
        Image($r('app.media.ic_queue_order_desc')).width(24)
        Text('排号说明').titleTextStyle()
      }.justifyContent(FlexAlign.Start)

      Text('·就餐人数超过8人可致电门店').descTextStyle()
      Text('·如需跨市别排号，请在下一个市别后排号').descTextStyle()
      Text('·同一手机号，在午市，晚市，夜市各市别，分别只能生成\n  一个排号').descTextStyle()

      Row() {
        Text('·就餐时段: ').fontSize(12).fontColor($r('sys.color.font_secondary'))
        Column({ space: 8 }) {
          this.textSpanBuilder('午市', '10:00-15:59')
          this.textSpanBuilder('晚市', '16:00-23:59')
          this.textSpanBuilder('夜市', '23:59-次日07:00')
        }.alignItems(HorizontalAlign.Start)
      }.alignItems(VerticalAlign.Top)
    }
    .height(224)
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Center)
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  queueInfoBuilder() {
    if (this.vm.storeQueueInfo) {
      Column({ space: 12 }) {
        Row() {
          Image($r('app.media.ic_queue_order_tips')).width(24)
          Text('当前排号').titleTextStyle()
        }

        List({ space: 25 }) {
          CommonListItem({
            pic: $r('app.media.ic_queue_order_coupons'),
            desc: '已取号数',
            value: this.vm.storeQueueInfo!.used + '',
          })

          CommonListItem({
            pic: $r('app.media.ic_queue_order_desk'),
            desc: '桌数',
            value: this.vm.deskInfo,
          })

          CommonListItem({
            pic: $r('app.media.ic_queue_order_say'),
            desc: '当前叫号',
            value: this.vm.type + this.vm.storeQueueInfo!.now,
          })
        }
        .width(CommonConstants.FULL_WIDTH)
        .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
      }
      .alignItems(HorizontalAlign.Start)
      .attributeModifier(CONTAINER_STYLE)
    }
  }

  @Builder
  textSpanBuilder(title: string, value: string) {
    Row({ space: 10 }) {
      Text(title).fontSize(12).fontColor($r('sys.color.font_secondary'))
      Text(value).fontSize(12).fontColor($r('sys.color.font_primary'))
    }
  }
}


@Extend(Text)
function whiteTextStyle(isMedium: boolean) {
  .lineHeight(19)
  .fontSize($r('sys.float.Body_M'))
  .fontColor($r('app.color.system_color_background_white'))
  .fontWeight(isMedium ? FontWeight.Medium : FontWeight.Regular)
}

@Extend(Text)
function titleTextStyle() {
  .fontSize(14)
  .fontColor($r('sys.color.font_primary'))
  .fontWeight(FontWeight.Medium)
  .margin({ left: $r('app.string.margin_8') })
}

@Extend(Text)
function descTextStyle() {
  .fontSize(12)
  .fontColor($r('sys.color.font_secondary'))
  .width(CommonConstants.FULL_WIDTH)
}

@Builder
export function queueOrderPageBuilder() {
  QueueOrderPage()
}