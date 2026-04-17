import { getUserInfoApi, userLoginApi } from '../network/apis/ApiList';
import { UserLoginResp } from '../network/types/ResponseTypes';
import { homePageBuilder } from '../pages/HomePage';
import { minePageBuilder } from '../pages/MinePage';
import { FormModel, TabListItem } from '../types/Types';
import { AccountModel, UserInfo, UserInfoModel } from '../types/UserInfo';
import { AccountUtil } from '../utils/AccountUtil';
import { WindowUtil } from '../utils/WindowUtil';
import { AppStorageV2 } from '@kit.ArkUI';
import { RouterModule } from 'book_queue';

@ObservedV2
export class EntryVM {
  // 页签索引
  @Trace curIndex: number = 0;
  // 用户信息
  @Trace userInfo: UserInfoModel = AccountUtil.getUserInfo();
  // 账号信息
  @Trace accountInfo: AccountModel = AccountUtil.getAccountInfo();
  // 卡片模型
  @Trace formInfo: FormModel = AppStorageV2.connect(FormModel, () => new FormModel())!;

  @Monitor('formInfo.url')
  public pageJump() {
    if (this.formInfo.url) {
      if (RouterModule.popToName(this.formInfo.url) !== -1) {
        RouterModule.replace({ url: this.formInfo.url, param: this.formInfo.orderId }, false);
      } else {
        RouterModule.push({ url: this.formInfo.url, param: this.formInfo.orderId }, false);
      }
      this.formInfo.url = '';
      this.formInfo.orderId = 0;
    }
  }

  public controller: TabsController = new TabsController();
  public tabList: TabListItem[] = [
    {
      label: '首页',
      icon: $r('app.media.ic_home'),
      iconChecked: $r('app.media.ic_home_checked'),
      component: wrapBuilder(homePageBuilder),
    },
    {
      label: '我的',
      icon: $r('app.media.ic_mine'),
      iconChecked: $r('app.media.ic_mine_checked'),
      component: wrapBuilder(minePageBuilder),
    },
  ];
  private static _instance: EntryVM;

  public static get instance() {
    if (!EntryVM._instance) {
      EntryVM._instance = new EntryVM();
    }
    return EntryVM._instance;
  }

  /**
   * 开启沉浸式布局
   * 静默登录、获取用户信息
   */
  public async init() {
    WindowUtil.initWindowUtil().then(() => {
      WindowUtil.setFullWindow();
    });
    AccountUtil.silentLogin().then(() => {
      this._getLoginUserInfo();
    });
  }

  /** 获取登录用户信息 **/
  private async _getLoginUserInfo() {
    const loginToken = this.accountInfo.loginToken;
    if (!loginToken) {
      const res = await userLoginApi();
      if (res.status === 200) {
        this.accountInfo.loginToken = res.data.loginToken;
        this._initUserInfo(res.data);
      }
    } else {
      const res = await getUserInfoApi();
      if (res.status === 200) {
        this._initUserInfo(res.data);
      }
    }
  }

  /** 更新用户信息 **/
  private _initUserInfo(data: UserInfo | UserLoginResp) {
    const info: UserInfo = {
      avatar: data.avatar,
      nickname: data.nickname,
      cellphone: data.cellphone,
    };
    AccountUtil.updateUserInfo(info);
  }
}