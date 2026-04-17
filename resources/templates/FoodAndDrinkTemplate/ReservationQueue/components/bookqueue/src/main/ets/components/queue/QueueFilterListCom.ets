import { CommonConstants } from '../../constants/Common';
import { CHOOSE_NUM } from '../../constants/Constants';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { QueueVM } from '../../viewmodels/QueueVM';
import { CommonSheet } from '../common/CommonSheet';

@ComponentV2
export struct QueueFilterListCom {
  vm: QueueVM = QueueVM.instance;

  build() {
    List({ space: 25 }) {

      ListItem() {
        Row() {
          Image($r('app.media.ic_book_time')).width(24).margin({ right: $r('app.string.margin_8') })
          Text('排号时间').descStyle()
          Row({ space: 4 }) {
            Text(this.vm.timeStr).valueStyle()
            Image($r('app.media.ic_right_arrow')).width(16)
          }
        }
      }

      ListItem() {
        Row() {
          Image($r('app.media.ic_book_people')).width(24).margin({ right: $r('app.string.margin_8') })
          Text('就餐人数').descStyle()
          Row({ space: 4 }) {
            Text(this.vm.headCount + '人').valueStyle()
            Image($r('app.media.ic_right_arrow')).width(16)
          }.onClick(() => {
            this.vm.showCount = true;
          })
        }
      }.bindSheet($$this.vm.showCount, this.countBindSheetBuilder, { height: SheetSize.FIT_CONTENT })

    }
    .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  countBindSheetBuilder() {
    CommonSheet({
      title: '人数选择',
      cancel: () => {
        this.vm.tempCountIndex = this.vm.headCount;
        this.vm.showCount = false;
      },
      confirm: () => {
        this.vm.headCount = CHOOSE_NUM[this.vm.tempCountIndex];
        this.vm.showCount = false;
      },
      ui: () => {
        this.textBuilder();
      },
    })
  }

  @Builder
  textBuilder() {
    TextPicker({ range: this.vm.countRange, selected: $$this.vm.tempCountIndex })
      .selectedTextStyle({ color: $r('app.color.brand_red') })
      .divider({
        strokeWidth: 1,
        startMargin: 98,
        endMargin: 98,
        color: '#eac4b9',
      })
      .height(200)
      .width(CommonConstants.FULL_WIDTH)
  }
}

@Extend(Text)
function valueStyle() {
  .fontSize(14)
  .fontColor($r('sys.color.font_primary'))
}

@Extend(Text)
function descStyle() {
  .fontSize(14)
  .layoutWeight(1)
  .fontColor($r('sys.color.font_secondary'))
}