import { CommonConstants, RouterMap } from '../../constants/Common';
import { BookOrderDetail, QueueOrderDetail } from '../../network/types/ResponseTypes';
import { RouterModule } from '../../utils/RouterModule';
import { formatPhoneNumber } from '../../utils/Format';
import { OrderVM } from '../../viewmodels/OrderVM';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { CommonPage } from '../../components/common/CommonPage';
import { CommonListItem } from '../../components/common/CommonListItem';

@ComponentV2
export struct OrderPage {
  vm: OrderVM = OrderVM.instance;
  loadingColor = $r('app.color.brand_red');

  aboutToAppear(): void {
    this.vm.index = 0;
  }

  build() {
    CommonPage({
      title: '订单',
      topUi: () => {
        this.navBarBuilder()
      },
      mainUi: () => {
        this.orderMainUiBuilder();
      },
      onShow: () => {
        this.vm.getAllOrders();
      },
    })
  }

  @Builder
  orderMainUiBuilder() {
    /** 订单区 **/
    if (!this.vm.init) {
      this.listBuilder()
    } else {
      LoadingProgress().size({ width: 72, height: 72 }).color(this.loadingColor).margin({ top: 160 })
    }
    Blank().layoutWeight(1)
  }

  @Builder
  navBarBuilder() {
    /** 导航区 **/
    Row({ space: 12 }) {
      this.navBarItemBuilder(0, '订座')
      this.navBarItemBuilder(1, '排号')
    }.justifyContent(FlexAlign.Start).width('calc(100% - 32vp)').margin({ bottom: 12 })
  }

  @Builder
  listBuilder() {
    if (this.vm.index) {
      if (this.vm.queueList.length) {
        this.queueListBuilder()
      } else {
        this.nullBuilder(1)
      }
    } else {
      if (this.vm.bookList.length) {
        this.bookListBuilder()
      } else {
        this.nullBuilder(0)
      }
    }
  }

  @Builder
  nullBuilder(index: number) {
    Column() {
      Image(index ? $r('app.media.ic_order_null_queue') : $r('app.media.ic_order_null_book'))
        .width(179)
        .height(126)
        .margin({ top: 64 })
      Text(`暂无${index ? '排号' : '订座'}记录`)
        .fontSize(14)
        .margin({ top: 25, bottom: 12 })
        .fontColor($r('sys.color.font_tertiary'))
      Button(index ? '去排号' : '去订座')
        .width(145)
        .height(40)
        .backgroundColor($r('app.color.brand_red'))
        .fontColor($r('sys.color.font_on_primary'))
        .onClick(() => {
          RouterModule.push({ url: index ? RouterMap.QUEUE_PAGE : RouterMap.BOOK_PAGE });
        })
    }
  }

  @Builder
  endBuilder() {
    Row() {
      Row({ space: 8 }) {
        Text().layoutWeight(1).height(1).backgroundColor($r('sys.color.comp_divider'))
        Text('暂无其他')
          .fontColor($r('sys.color.font_tertiary'))
          .fontSize(14)
          .textAlign(TextAlign.Center)
        Text().layoutWeight(1).height(1).backgroundColor($r('sys.color.comp_divider'))
      }.width('calc(100% - 24vp)')
    }.width(CommonConstants.FULL_WIDTH).justifyContent(FlexAlign.Center)
  }

  @Builder
  navBarItemBuilder(index: number, text: string) {
    Text(text)
      .fontColor(index === this.vm.index ? $r('app.color.system_color_background_white') : $r('sys.color.font_primary'))
      .backgroundColor(index === this.vm.index ? $r('app.color.brand_red') : '#E6E8E9')
      .width(73)
      .height(36)
      .fontWeight(FontWeight.Medium)
      .textAlign(TextAlign.Center)
      .borderRadius($r('app.string.border_radius_16'))
      .onClick(() => {
        this.vm.index = index;
      })
  }

  @Builder
  bookListBuilder() {
    List({ space: 12 }) {
      ForEach(this.vm.bookList, (order: BookOrderDetail) => {
        ListItem() {
          Column({ space: 10 }) {
            List({ space: 24 }) {
              ListItem() {
                Row() {
                  Image($r('app.media.ic_book_order_location')).width(24)
                  Column({ space: 8 }) {
                    Text(order.store.name).fontColor($r('sys.color.font_primary')).fontWeight(FontWeight.Medium)
                    Text(order.store.location).fontSize(10).fontColor($r('sys.color.font_secondary'))
                  }
                  .layoutWeight(1)
                  .margin({ left: $r('app.string.margin_8') })
                  .alignItems(HorizontalAlign.Start)
                }
              }

              CommonListItem({
                pic: $r('app.media.ic_book_order_phone'),
                desc: '联系方式',
                value: formatPhoneNumber(order.phone),
              })
              CommonListItem({ pic: $r('app.media.ic_book_order_people'), desc: '就餐人数', value: order.count + '人' })
              CommonListItem({ pic: $r('app.media.ic_book_order_time'), desc: '就餐时间', value: order.time })
            }
            .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
            .onClick(() => {
              RouterModule.push({ url: RouterMap.BOOK_RES_PAGE, param: order.orderId });
            })

            Text('取消订座').btnStyle().onClick(() => {
              this.vm.cancelBookOrder(order.orderId);
            })
          }.alignItems(HorizontalAlign.End)
        }.attributeModifier(CONTAINER_STYLE)
      }, (order: BookOrderDetail, index) => JSON.stringify(order) + '_' + index)

      ListItem() {
        this.endBuilder()
      }
    }
  }

  @Builder
  queueListBuilder() {
    List({ space: 12 }) {
      ForEach(this.vm.queueList, (order: QueueOrderDetail) => {
        ListItem() {
          Column({ space: 10 }) {
            List({ space: 24 }) {
              ListItem() {
                Row() {
                  Image($r('app.media.ic_book_order_location')).width(24)
                  Column({ space: 8 }) {
                    Text(order.store.name).fontColor($r('sys.color.font_primary')).fontWeight(FontWeight.Medium)
                    Text(order.store.location).fontSize(10).fontColor($r('sys.color.font_secondary'))
                  }
                  .layoutWeight(1)
                  .margin({ left: $r('app.string.margin_8') })
                  .alignItems(HorizontalAlign.Start)
                }
              }

              CommonListItem({ pic: $r('app.media.ic_book_order_people'), desc: '就餐人数', value: order.count + '人' })
              CommonListItem({ pic: $r('app.media.ic_queue_order_tips'), desc: '我的号码', value: order.mine + '号' })
            }
            .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
            .onClick(() => {
              RouterModule.push({ url: RouterMap.QUEUE_RES_PAGE, param: order.orderId });
            })

            Text('取消排号').btnStyle().onClick(() => {
              this.vm.cancelQueueOrder(order.orderId);
            })
          }.alignItems(HorizontalAlign.End)
        }.attributeModifier(CONTAINER_STYLE)
      }, (order: QueueOrderDetail, index) => JSON.stringify(order) + '_' + index)

      ListItem() {
        this.endBuilder()
      }
    }
  }
}

@Extend(Text)
function btnStyle() {
  .height(40)
  .width(144)
  .borderRadius(20)
  .textAlign(TextAlign.Center)
  .fontWeight(FontWeight.Medium)
  .fontColor($r('app.color.brand_red'))
  .border({ color: $r('app.color.brand_red'), width: 1 })
}

@Builder
export function orderPageBuilder() {
  OrderPage()
}