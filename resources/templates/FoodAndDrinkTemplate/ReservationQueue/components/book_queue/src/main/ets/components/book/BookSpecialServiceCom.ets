import { DECORATIONS, TABLE_WARES } from '../../constants/Constants';
import { BookVM } from '../../viewmodels/BookVM';
import { LengthUnit } from '@kit.ArkUI';
import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';

@ComponentV2
export struct BookSpecialServiceCom {
  vm: BookVM = BookVM.instance;

  getFontColor(onlyOne: boolean, value: string) {
    if (onlyOne) {
      return this.vm.decoration === value ? $r('app.color.system_color_background_white') :
      $r('sys.color.font_primary');
    }
    return this.vm.tableWares.includes(value) ? $r('app.color.system_color_background_white') :
    $r('sys.color.font_primary');
  }

  getBgColor(onlyOne: boolean, value: string) {
    if (onlyOne) {
      return this.vm.decoration === value ? $r('app.color.brand_red') : $r('sys.color.interactive_click');
    }
    return this.vm.tableWares.includes(value) ? $r('app.color.brand_red') : $r('sys.color.interactive_click');
  }

  build() {
    Column({ space: 12 }) {
      Text('特殊需求').titleTextStyle(true)
      this.decorationsBuilder()
      this.tableWaresBuilder()
    }
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  decorationsBuilder() {
    Column({ space: 8 }) {
      Text('装饰类').titleTextStyle(false)
      Flex({
        wrap: FlexWrap.Wrap,
        space: { main: { value: 8, unit: LengthUnit.VP }, cross: { value: 12, unit: LengthUnit.VP } },
      }) {
        ForEach(DECORATIONS, (item: string) => {
          this.btnBuilder(true, item)
        }, (item: string, index) => item + '_' + index)
      }
    }
  }

  @Builder
  tableWaresBuilder() {
    Column({ space: 8 }) {
      Text('餐具类').titleTextStyle(false)
      Flex({
        wrap: FlexWrap.Wrap,
        space: { main: { value: 8, unit: LengthUnit.VP }, cross: { value: 12, unit: LengthUnit.VP } },
      }) {
        ForEach(TABLE_WARES, (item: string) => {
          this.btnBuilder(false, item)
        }, (item: string, index) => item + '_' + index)
      }
    }
  }

  @Builder
  btnBuilder(onlyOne: boolean, value: string) {
    Text(value)
      .lineHeight(13)
      .fontSize($r('sys.float.Caption_M'))
      .padding({
        left: 8,
        right: 8,
        top: 5,
        bottom: 5,
      })
      .fontColor(this.getFontColor(onlyOne, value))
      .backgroundColor(this.getBgColor(onlyOne, value))
      .onClick(() => this.vm.specialOpt(onlyOne, value))
      .borderRadius($r('app.string.border_radius_8'))
  }
}

@Extend(Text)
function titleTextStyle(main: boolean) {
  .height(20)
  .fontSize(main ? 14 : 12)
  .fontColor($r('sys.color.font_primary'))
  .fontWeight(main ? FontWeight.Medium : FontWeight.Regular)
  .width(CommonConstants.FULL_WIDTH)
}
