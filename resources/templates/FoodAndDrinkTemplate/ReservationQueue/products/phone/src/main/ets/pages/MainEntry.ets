import { BookQueue, WidgetUtil } from 'book_queue';
import { CommonConstants } from '../constants/CommonContants';
import { TabListItem } from '../types/Types';
import { EntryVM } from '../viewmodels/EntryVM';

@Entry
@ComponentV2
struct MainEntry {
  vm: EntryVM = EntryVM.instance;
  @Provider('stack') stack: NavPathStack = new NavPathStack();

  async aboutToAppear() {
    /** 模块初始化 **/
    BookQueue.init(this.stack, this.getUIContext(), true);
    /** 工程初始化 **/
    await this.vm.init();
    /** 同步服务卡片 **/
    WidgetUtil.subscribeFormId(getContext());
    WidgetUtil.subscribeQueueId();
    /** 页面跳转事件 **/
    this.vm.pageJump();
  }

  build() {
    Navigation(this.stack) {
      Column() {
        Tabs({ barPosition: BarPosition.End, index: $$this.vm.curIndex, controller: this.vm.controller }) {
          ForEach(this.vm.tabList, (item: TabListItem, index: number) => {
            TabContent() {
              item.component.builder();
            }
            .tabBar(this.tabBarBuilder(item, index))
          }, (item: TabListItem, index) => JSON.stringify(item) + '_' + index)
        }
        .scrollable(false)
        .barMode(BarMode.Fixed)
        .barHeight(TabStyle.BAR_HEIGHT)
        .height(CommonConstants.FULL_HEIGHT)
        .animationDuration(TabStyle.ANIMATION_DURATION)
      }
      .backgroundColor($r('app.color.system_color_background_white'))
    }
    .hideToolBar(true)
    .hideTitleBar(true)
    .hideBackButton(true)
    .mode(NavigationMode.Stack)
  }

  @Builder
  tabBarBuilder(item: TabListItem, index: number) {
    Column({ space: 4 }) {
      Image(this.vm.curIndex === index ? item.iconChecked : item.icon)
        .width(TabStyle.ICON_SIZE)
        .height(TabStyle.ICON_SIZE)
      Text(item.label)
        .fontSize($r('sys.float.Caption_M'))
        .fontColor(this.vm.curIndex === index ?
        $r('app.color.brand_red') : $r('sys.color.icon_secondary'))
    }
    .justifyContent(FlexAlign.Start)
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .padding({ top: $r('app.string.padding_10') })
  }
}

export class TabStyle {
  static readonly BAR_HEIGHT = 76;
  static readonly ANIMATION_DURATION = 0;
  static readonly ICON_SIZE = 24;
}