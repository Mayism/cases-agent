import { AppStorageV2 } from '@kit.ArkUI';
import {
  CommonConstants,
  NewsTypeModel,
  NewsViewModel,
  WindowModel,
  LocationUtil,
} from 'commonlib';
import { BaseTitle } from 'componentlib';
import { HomeContentView } from '../components/HomeContentView';
import { HomePageVM } from '../viewModels/HomePageVM';
import { common } from '@kit.AbilityKit';


@Builder
export function homePageBuilder() {
  HomePage()
}

@ComponentV2
export struct HomePage {
  @Param initSize: number = 0;
  @Local tabBarArray: NewsTypeModel[] = new NewsViewModel().getDefaultTypeList();
  @Local currentIndex: number = 0;
  windowModel: WindowModel = AppStorageV2.connect(WindowModel, () => new WindowModel())!;
  vm: HomePageVM = HomePageVM.instance;

  aboutToAppear(): void {
    // 设置位置工具的上下文
    LocationUtil.setContext(getContext(this) as common.UIAbilityContext);
    // 自动定位当前位置
    this.vm.autoLocate();
  }

  build() {
    Column() {
      BaseTitle({
        customTitle: () => {
          this.HomeTitleBuilder()
        },
      })
      Tabs({ barPosition: BarPosition.Start }) {
        ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
          TabContent() {
            HomeContentView()
          }
          .backgroundColor($r('app.color.bgc'))
          .padding({top: 8})
          .tabBar(
            new SubTabBarStyle(tabsItem.name)
              .labelStyle({
                unselectedColor: $r('app.color.news_time_fontColor'),
                selectedColor: $r('app.color.fontColor_text3'),
                font: {
                  size: 16 + this.windowModel.fontSize,
                  weight: this.currentIndex === index ? FontWeight.Bold : FontWeight.Regular
                }
              })
              .indicator({
                color: $r('app.color.tab_indicator_color'),
                height: 2,
                width: 20,
                marginTop: 8,
                borderRadius: 2
              })
              .padding({left: 10, right: 10, top: 8, bottom: 8 })
          )
        }, (item: NewsTypeModel) => JSON.stringify(item));
      }
      .barHeight(48)
      .barMode(BarMode.Scrollable)
      .barWidth(CommonConstants.FULL_PERCENT)
      .vertical(false)
      .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
        this.currentIndex = targetIndex;
      })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  HomeTitleBuilder() {
    Row() {
      Text('首页')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
      
      // 位置显示组件
      Row() {
        // 使用定位符号
        Text('\uE678')
          .fontSize(16)
          .fontColor($r('app.color.icon_color_level2'))
          .fontFamily('HarmonyOS-Sans')
        
        Text(this.vm.currentCity)
          .fontSize(14)
          .fontColor($r('app.color.icon_color_level2'))
          .margin({ left: 4 })
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        
        // 定位加载指示器
        if (this.vm.isLocating) {
          LoadingProgress()
            .width(14)
            .height(14)
            .color($r('app.color.icon_color_level2'))
            .margin({ left: 4 })
        }
      }
      .margin({ left: 16 })
      .onClick(() => {
        // 点击刷新位置
        this.vm.refreshLocation();
      })
    }
    .alignItems(VerticalAlign.Center)
  }
}