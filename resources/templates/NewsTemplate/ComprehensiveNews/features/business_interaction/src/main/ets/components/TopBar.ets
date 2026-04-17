import { CommonConstants, SettingModel } from 'lib_common'
import { TabItem, TAB_LIST } from '../common/Constants'
import { PersistenceV2 } from '@kit.ArkUI';

@ComponentV2
export struct TopBar {
  @Param selectedId: number = 0;
  @Event onClickBar: (selectedId: number) => void = () => {};
  @Local settingInfo: SettingModel = PersistenceV2.connect(SettingModel, () => new SettingModel())!

  build() {
    Row({ space: CommonConstants.SPACE_L }) {
      ForEach(TAB_LIST, (v: TabItem) => {
        Column({ space: CommonConstants.SPACE_S }) {
          Text(v.label)
            .fontSize(16 * this.settingInfo.fontSizeRatio)
            .fontColor(this.selectedId === v.id ? $r('app.color.app_theme') : $r('sys.color.font_secondary'))
            .fontWeight(this.selectedId === v.id ? FontWeight.Bold : FontWeight.Regular)
          Row()
            .width(16)
            .height(2)
            .backgroundColor($r('app.color.app_theme'))
            .visibility(this.selectedId === v.id ? Visibility.Visible : Visibility.Hidden)
        }
        .padding({
          top: CommonConstants.SPACE_L,
          bottom: CommonConstants.SPACE_S,
        })
        .onClick(() => {
          this.onClickBar(v.id);
        })
      }, (v: TabItem) => v.id + v.label)
    }
  }
}