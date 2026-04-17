import { UserInfo } from '../models/UserInfo';

@ComponentV2
export struct MainPage {
  @Consumer('navPathStack') navPathStack: NavPathStack;
  @Consumer('userInfo') userInfo: UserInfo;

  build() {
    NavDestination() {
      Column() {
        // User info section
        Row() {
          if (this.userInfo.avatarUri) {
            Image(this.userInfo.avatarUri)
              .width(56)
              .height(56)
              .borderRadius(28)
              .draggable(false)
          } else {
            Image($r('app.media.startIcon'))
              .width(56)
              .height(56)
              .borderRadius(28)
              .draggable(false)
          }

          Column() {
            Text(this.userInfo.nickname || '商家用户')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#1A1A1A')

            Text('欢迎回来')
              .fontSize(14)
              .fontColor('#999999')
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 16 })
        }
        .width('100%')
        .padding({ left: 24, right: 24, top: 24, bottom: 16 })

        // Function cards section
        Column() {
          Text('功能区')
            .fontSize(18)
            .fontWeight(FontWeight.Medium)
            .fontColor('#1A1A1A')
            .margin({ bottom: 16 })

          Row() {
            FunctionCard({ icon: '📋', title: '订单管理', desc: '查看和处理订单' })
            FunctionCard({ icon: '🍽️', title: '菜品管理', desc: '管理菜品信息' })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Row() {
            FunctionCard({ icon: '📊', title: '经营数据', desc: '查看经营报表' })
            FunctionCard({
              icon: '⚙️',
              title: '店铺设置',
              desc: '管理店铺信息',
              onClick: () => {
                this.navPathStack.pushPathByName('SettingsPage', null);
              }
            })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 12 })
        }
        .width('100%')
        .padding({ left: 24, right: 24, top: 24 })

        Column().layoutWeight(1)

        // Logout button
        Button('退出登录')
          .width('90%')
          .height(48)
          .fontSize(16)
          .fontColor('#FF3B30')
          .backgroundColor('#FFFFFF')
          .borderWidth(1)
          .borderColor('#FF3B30')
          .borderRadius(24)
          .margin({ bottom: 40 })
          .onClick(() => {
            this.userInfo.nickname = '';
            this.userInfo.avatarUri = '';
            this.userInfo.isLoggedIn = false;
            this.navPathStack.clear();
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
    }
    .hideTitleBar(true)
  }
}

@ComponentV2
struct FunctionCard {
  @Param icon: string = '';
  @Param title: string = '';
  @Param desc: string = '';
  @Param onClick: () => void = () => {};

  build() {
    Column() {
      Text(this.icon)
        .fontSize(32)
        .margin({ bottom: 8 })

      Text(this.title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#1A1A1A')

      Text(this.desc)
        .fontSize(12)
        .fontColor('#999999')
        .margin({ top: 4 })
    }
    .width('48%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.onClick();
    })
  }
}