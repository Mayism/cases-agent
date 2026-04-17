import { BookQueueRouterMap } from 'book_queue';
import { CommonHeader } from '../components/CommonHeader';
import { CommonConstants } from '../constants/CommonContants';
import { HomeVM } from '../viewmodels/HomeVM';

@ComponentV2
export struct HomePage {
  vm: HomeVM = HomeVM.instance;
  @Consumer('stack') stack: NavPathStack = new NavPathStack();

  build() {
    Column() {
      CommonHeader({ title: '首页', showBackButton: false })

      Scroll() {
        Column({ space: 12 }) {
          /** 顶部Banner **/
          this.topBuilder()

          /** 订座排号入口 **/
          this.middlesBuilder()

          /** 底部Banner **/
          this.bottomBuilder()

          Blank().layoutWeight(1)
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .width('calc(100% - 32vp)')
    }
    .backgroundColor($r('app.color.system_color_background_gray'))
  }

  @Builder
  topBuilder() {
    Column() {
      Text('别担心没座位，足不出户，在家动动手指先预订吧！')
        .width('calc(100% - 24vp)')
        .fontSize(18)
        .lineHeight(24)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.background_primary'))
        .backgroundColor('rgba(0,0,0,0.22)')
        .borderRadius('50%')
        .padding({
          left: 22,
          right: 22,
          top: 12,
          bottom: 12,
        })
    }
    .backgroundImage($r('app.media.ic_home_pic0'))
    .justifyContent(FlexAlign.Center)
    .backgroundImageSize(ImageSize.Cover)
    .width(CommonConstants.FULL_WIDTH)
    .height(188)
    .borderRadius($r('app.string.border_radius_16'))
  }

  @Builder
  middlesBuilder() {
    Row({ space: 12 }) {
      Column({ space: 6 }) {
        Text('订个座位')
          .fontColor($r('app.color.brand_red'))
          .fontWeight(FontWeight.Bold)
        Text('提前订座，避免排队')
          .fontSize(10)
          .fontColor($r('sys.color.font_tertiary'))
      }
      .itemStyle()
      .backgroundImage($r('app.media.ic_home_pic1'))
      .onClick(() => {
        this.stack.pushPathByName(BookQueueRouterMap.BOOK_PAGE, null)
      })

      Column({ space: 6 }) {
        Text('排个号码')
          .fontColor($r('app.color.brand_red'))
          .fontWeight(FontWeight.Bold)
        Text('提前排号，无需等待')
          .fontSize(10)
          .fontColor($r('sys.color.font_tertiary'))
      }
      .itemStyle()
      .backgroundImage($r('app.media.ic_home_pic2'))
      .onClick(() => {
        this.stack.pushPathByName(BookQueueRouterMap.QUEUE_PAGE, null)
      })
    }
  }

  @Builder
  bottomBuilder() {
    Column({ space: 6 }) {
      Text('我看看新时代的年轻人，\n' +
        '还有谁不会先订座取号再吃饭的～')
        .fontColor($r('app.color.system_color_background_white'))
        .fontWeight(FontWeight.Medium)
        .fontSize(14)
        .lineHeight(20)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(110)
    .borderRadius($r('app.string.border_radius_16'))
    .padding($r('app.string.padding_16'))
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage($r('app.media.ic_home_pic3'))
  }
}

@Extend(Column)
function itemStyle() {
  .layoutWeight(1)
  .height(160)
  .borderRadius($r('app.string.border_radius_16'))
  .padding($r('app.string.padding_16'))
  .justifyContent(FlexAlign.Start)
  .alignItems(HorizontalAlign.Start)
  .backgroundImageSize({ width: '100%', height: '100%' })
}

@Builder
export function homePageBuilder() {
  HomePage()
}