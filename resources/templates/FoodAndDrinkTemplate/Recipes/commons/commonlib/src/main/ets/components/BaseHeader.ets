import { RouterMap } from '../constants/CommonEnums';
import { AccountUtil } from '../utils/AccountUtil';
import { RouterModule } from '../utils/RouterModule';
import { HeaderMenuBuilder } from './HeaderMenuBuilder';

@ComponentV2
export struct BaseHeader {
  @Param title: string = '首页';
  @Param showSearch: boolean = false;
  @Param showTitle: boolean = true;
  @Param showLeftMenu: boolean = false;
  @Param showRightMenu: boolean = false;
  @Param showMsg: boolean = false;
  @Param showService: boolean = false;
  @Param noticeNum: number = 0;
  @Event
  changeSideBar: (flag: boolean) => void = () => {
  }

  build() {
    Row() {
      Row() {
        if (this.showLeftMenu) {
          Image($r('app.media.ic_title_left_menu')).width(40).height(40).onClick(() => {
            this.changeSideBar(true)
          })
        }
        if (this.showTitle) {
          Text(this.showSearch ? '菜谱' : this.title)
            .fontSize(24)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('sys.color.font_primary'))
            .margin({ left: 8 })
        }
      }

      Row({ space: 8 }) {
        Image($r('app.media.ic_title_search')).width(40).height(40).onClick(() => {
          RouterModule.push(RouterMap.SEARCH)
        }).visibility(this.showSearch ? Visibility.Visible : Visibility.None)
        Image($r('app.media.ic_title_menu'))
          .width(40)
          .height(40)
          .bindMenu(HeaderMenuBuilder())
          .visibility(this.showRightMenu ? Visibility.Visible : Visibility.None)
      }

      if (this.showMsg) {
        Row({ space: 8 }) {
          Badge({
            count: this.noticeNum,
            style: { fontSize: 10, badgeSize: 16 },
          }) {
            Image($r('app.media.ic_title_msg')).width(40).height(40).onClick(() => {
              if (AccountUtil.getUserInfo().isLogin) {
                RouterModule.push(RouterMap.NOTICE_CENTER_PAGE)
              } else {
                RouterModule.push(RouterMap.QUICK_LOGIN_PAGE);
              }
            })
          }
        }
      }
    }
    .height(56)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .shadow({
      offsetX: 0,
      offsetY: 4,
      color: '#1A000000',
      radius: this.showSearch ? 4 : 0,
    })
    .padding({ left: 16, right: 16 })
  }
}
