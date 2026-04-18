import { BaseViewModel } from '../models/BaseViewModel';
import { SettingItem } from '../types/SettingItem';
import { SettingPageEnum, SettingType } from '../types/SettingType';

@ObservedV2
export class SettingPrivacyVM extends BaseViewModel {
  userAgreeItem = new SettingItem()
    .setType(SettingType.ROUTER)
    .setLabel('用户协议')
    .setRouterParam({
      routerName: SettingPageEnum.SETTING_AGREEMENT,
      routerParams: this.configInfo.agreementModel.userAgreement,
    });
  privacyItem = new SettingItem()
    .setType(SettingType.ROUTER)
    .setLabel('隐私政策')
    .setRouterParam({
      routerName: SettingPageEnum.SETTING_AGREEMENT,
      routerParams: this.configInfo.agreementModel.privacyPolicy,
    });
  thirtyItem = new SettingItem()
    .setType(SettingType.ROUTER)
    .setLabel('第三方信息共享清单')
    .setRouterParam({
      routerName: SettingPageEnum.SETTING_AGREEMENT,
      routerParams: this.configInfo.agreementModel.thirtyItem,
    });
  personInfoItem = new SettingItem()
    .setType(SettingType.ROUTER)
    .setLabel('个人信息收集清单')
    .setRouterParam({
      routerName: SettingPageEnum.SETTING_AGREEMENT,
      routerParams: this.configInfo.agreementModel.personalCollection,
    });
  list1: SettingItem[] = [this.userAgreeItem, this.privacyItem];
  list2: SettingItem[] = [this.thirtyItem, this.personInfoItem];
}
