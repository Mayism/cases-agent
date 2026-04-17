import { loginComponentManager, LoginWithHuaweiIDButton } from '@kit.AccountKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UserInfo } from '../models/UserInfo';

const DOMAIN = 0x0000;
const TAG = '[LoginPage]';

@ComponentV2
export struct LoginPage {
  @Param navPathStack: NavPathStack = new NavPathStack();
  @Consumer('userInfo') userInfo: UserInfo;

  controller: loginComponentManager.LoginWithHuaweiIDButtonController =
    new loginComponentManager.LoginWithHuaweiIDButtonController()
      .setAgreementStatus(loginComponentManager.AgreementStatus.ACCEPTED)
      .onClickLoginWithHuaweiIDButton((error: BusinessError | undefined,
        response: loginComponentManager.HuaweiIDCredential) => {
        if (error) {
          hilog.error(DOMAIN, TAG, 'Login failed: %{public}s', JSON.stringify(error));
          return;
        }
        this.userInfo.nickname = response.name;
        this.userInfo.avatarUri = response.avatarUriString;
        this.userInfo.isLoggedIn = true;
        this.navPathStack.pushPathByName('MainPage', null);
      });

  build() {
    Column() {
      Column() {
        Text('餐厅管理后台')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
          .margin({ top: 160 })

        Text('商家管理平台')
          .fontSize(16)
          .fontColor('#999999')
          .margin({ top: 8 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Column().layoutWeight(1)

      Column() {
        LoginWithHuaweiIDButton({
          params: {
            style: loginComponentManager.Style.BUTTON_CUSTOM,
            extraStyle: {
              buttonStyle: new loginComponentManager.ButtonStyle().loadingStyle({ show: true }),
            },
            loginType: loginComponentManager.LoginType.QUICK_LOGIN,
            supportDarkMode: true,
          },
          controller: this.controller,
        })
      }
      .width('100%')
      .height(48)
      .margin({ bottom: 60 })
      .padding({ left: 24, right: 24 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}