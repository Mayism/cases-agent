import { UserInfo } from '../models/UserInfo';
import { LoginPage } from './LoginPage';
import { MainPage } from './MainPage';
import { SettingsPage } from './SettingsPage';

@Entry
@ComponentV2
struct Index {
  @Local navPathStack: NavPathStack = new NavPathStack();
  @Provider('userInfo') userInfo: UserInfo = new UserInfo();

  @Builder
  PageBuilder(name: string, params: Object) {
    if (name === 'MainPage') {
      MainPage()
    } else if (name === 'SettingsPage') {
      SettingsPage()
    }
  }

  build() {
    Navigation(this.navPathStack) {
      LoginPage({ navPathStack: this.navPathStack })
    }
    .navDestination(this.PageBuilder)
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
  }
}