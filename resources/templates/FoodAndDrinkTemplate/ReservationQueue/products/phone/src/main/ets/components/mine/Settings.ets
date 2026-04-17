import { CommonConstants } from '../../constants/CommonContants';
import { SettingItem } from '../../types/Types';
import { MineVM } from '../../viewmodels/MineVM';

@ComponentV2
export struct Settings {
  vm: MineVM = MineVM.instance;
  @Local showCall: boolean = false;
  @Consumer('stack') stack: NavPathStack = new NavPathStack();

  build() {
    List({ space: 12 }) {
      ForEach(this.vm.getSettingGroupList(), (group: SettingItem[]) => {
        ListItemGroup({ space: 24 }) {
          ForEach(group, (item: SettingItem) => {
            this.settingListItemBuilder(item)
          }, (item: SettingItem, index) => JSON.stringify(item) + '_' + index)
        }
        .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
        .containerStyle()
      }, (group: SettingItem, index) => JSON.stringify(group) + '_' + index)
    }
  }

  @Builder
  settingListItemBuilder(item: SettingItem) {
    ListItem() {
      Row() {
        Image(item.icon).width(24).margin({ right: $r('app.string.margin_8') })
        Text(item.label)
          .flexGrow(1)
          .fontSize($r('sys.float.Subtitle_M'))
          .fontColor($r('sys.color.font_primary'))
        Image($r('app.media.ic_arrow')).width(16)
      }
      .width(CommonConstants.FULL_WIDTH)
    }
    .onClick(() => {
      this.stack.pushPathByName(item.url, null);
    })
  }

  @Styles
  containerStyle() {
    .padding($r('app.string.padding_12'))
    .borderRadius($r('app.string.border_radius_16'))
    .backgroundColor($r('app.color.system_color_background_white'))
  }
}