import { TabListItem } from '../types/Types';
import { MainEntryVM } from '../viewmodels/MainEntryVM';
import { emitter } from '@kit.BasicServicesKit';
import { RouterMap, RouterModule } from 'commonlib';

@Builder
export function MainEntryBuilder() {
  MainEntry()
}

@ComponentV2
struct MainEntry {
  @Local vm: MainEntryVM = MainEntryVM.instance;
  private controller: TabsController = new TabsController();
  callBackFunc: () => void = () => {
    this.controller.changeIndex(1);
  };

  @Monitor('vm.formCardJump.form.id', 'vm.formCardJump.form.url')
  formChange(monitor: IMonitor) {
    if (monitor.value('vm.formCardJump.form.url')?.now) {
      let url = monitor.value('vm.formCardJump.form.url')?.now as string;
      this.widgetInterception(url);
    }
  }

  /*
    * 卡片跳转拦截
    * */
  widgetInterception(url: string) {
    if (url) {
      if (url === RouterMap.HOME) {
        RouterModule.popToName(RouterMap.MAIN_ENTRY)
        this.controller.changeIndex(0);
      } else {
        if (url === RouterMap.MY_COLLECTION && !this.vm.userInfo.isLogin) {
          RouterModule.push(RouterMap.QUICK_LOGIN_PAGE, { 'url': url } as Record<string, string>);
        } else {
          RouterModule.push(url);
        }
      }
      this.vm.formCardJump.form.url = '';
    }
  }

  aboutToAppear(): void {
    emitter.on('jumpPage', this.callBackFunc);
    let url = this.vm.formCardJump.form.url;
    this.widgetInterception(url);
  }

  aboutToDisappear(): void {
    emitter.off('jumpPage', this.callBackFunc);
  }

  build() {
    NavDestination() {
      Column() {
        Tabs({ barPosition: BarPosition.End, index: this.vm.curIndex, controller: this.controller }) {
          ForEach(this.vm.tabList, (item: TabListItem, index: number) => {
            TabContent() {
              item.component.builder();
            }
            .tabBar(this.tabBarBuilder(item, index))
            .clip(index !== 0)
            .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP]);
          }, (item: TabListItem) => item.label);
        }
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
        .scrollable(false)
        .height('100%')
        .barHeight(48)
        .animationDuration(0)
        .barMode(BarMode.Fixed)
        .onChange((index: number) => {
          this.vm.curIndex = index;
          if (index === 3) {
            emitter.emit('refreshMinePage')
          }
        });
      }
      .backgroundColor(Color.White)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP]);
    }
    .hideTitleBar(true).onShown(() => {
      if (this.vm.curIndex === 3) {
        emitter.emit('refreshMinePage')
      }
    })
  }

  @Builder
  tabBarBuilder(item: TabListItem, index: number) {
    Column() {
      Image(this.vm.curIndex === index ? item.iconChecked : item.icon)
        .width(24)
        .height(24);
      Text(item.label)
        .fontColor(this.vm.curIndex === index ? '#FD4238' :
          '#99000000')
        .fontSize(10)
        .margin({ top: 4 });
    }.width('100%').padding({ top: 10 });
  }
}