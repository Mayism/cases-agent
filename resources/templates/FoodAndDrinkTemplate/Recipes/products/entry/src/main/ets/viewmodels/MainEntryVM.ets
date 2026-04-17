import { AccountUtil, UserInfo } from 'commonlib';
import { FormCardJump, TabListItem } from '../types/Types';
import { HomePageBuilder } from 'home';
import { ClassificationPageBuilder } from 'classification';
import { MinePageBuilder } from 'mine';
import { AppStorageV2 } from '@kit.ArkUI';
import { CaloriesPageBuilder } from 'calories';

const TAG: string = 'MainEntryVM';

@ObservedV2
export class MainEntryVM {
  @Trace userInfo: UserInfo = AccountUtil.getUserInfo();
  @Trace formCardJump: FormCardJump = AppStorageV2.connect(FormCardJump, () => new FormCardJump())!;
  @Trace curIndex: number = 0;
  public tabList: TabListItem[] = [
    {
      label: '首页',
      icon: $r('app.media.icon_home_off'),
      iconChecked: $r('app.media.icon_home_on'),
      component: wrapBuilder(HomePageBuilder),
    },
    {
      label: '分类',
      icon: $r('app.media.icon_type_off'),
      iconChecked: $r('app.media.icon_type_on'),
      component: wrapBuilder(ClassificationPageBuilder),
    },
    {
      label: '热量计算',
      icon: $r('app.media.icon_fire_off'),
      iconChecked: $r('app.media.icon_fire_on'),
      component: wrapBuilder(CaloriesPageBuilder),
    },
    {
      label: '我的',
      icon: $r('app.media.icon_mine_off'),
      iconChecked: $r('app.media.icon_mine_on'),
      component: wrapBuilder(MinePageBuilder),
    },
  ];
  private static _instance: MainEntryVM;

  public static get instance() {
    if (!MainEntryVM._instance) {
      MainEntryVM._instance = new MainEntryVM();
    }
    return MainEntryVM._instance;
  }
}
