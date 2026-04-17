import { RouterMap } from '../constants/CommonEnums';
import { RouterModule } from '../utils/RouterModule';
import { HeaderMenuBuilder } from './HeaderMenuBuilder';

@Builder
export function buildTitleBar(title: string | undefined, showSearch: boolean = false, showMenu: boolean = false) {
  Row() {
    Text(title)
      .fontSize(20)
      .fontWeight(FontWeight.Medium)
      .maxLines(1)
      .textOverflow({ overflow: TextOverflow.Ellipsis })
      .layoutWeight(1)
      .fontColor($r('sys.color.font_primary'))
    Row({ space: 8 }) {
      Image($r('app.media.ic_title_search')).width(40).height(40).onClick(() => {
        RouterModule.push(RouterMap.SEARCH)
      }).visibility(showSearch ? Visibility.Visible : Visibility.None);
      Image($r('app.media.ic_title_left_menu'))
        .width(40)
        .height(40)
        .bindMenu(HeaderMenuBuilder())
        .visibility(showMenu ? Visibility.Visible : Visibility.None);
    }
  }
  .height(56)
  .justifyContent(FlexAlign.SpaceBetween)
  .layoutWeight(1)
  .padding({ left: 8, right: 12 })
}