import { CommonConstants, RouterMap } from '../../constants/Common';
import { RouterModule } from '../../utils/RouterModule';
import { QueueVM } from '../../viewmodels/QueueVM';
import { promptAction } from '@kit.ArkUI';
import { OrderUtil } from '../../utils/OrderUtil';
import { CommonPage } from '../../components/common/CommonPage';
import { CommonShow } from '../../components/common/CommonShow';
import { CommonListItem } from '../../components/common/CommonListItem';

@ComponentV2
export struct QueueResPage {
  vm: QueueVM = QueueVM.instance;

  aboutToAppear(): void {
    const orderId: number = RouterModule.getNavParam({ url: RouterMap.QUEUE_RES_PAGE }) as number;
    this.vm.order = OrderUtil.getQueueOrderById(getContext(), orderId);
    if (this.vm.order?.wait && this.vm.order.wait < 0) {
      promptAction.showToast({ message: '排号已过期' });
      RouterModule.pop();
    }
  }

  build() {
    CommonPage({
      title: '排号成功',
      mainUi: () => {
        this.queueResMainUiBuilder();
      },
      bottomUi: () => {
        this.queueResBottomUiBuilder();
      },
    })
  }

  @Builder
  queueResMainUiBuilder() {
    /** 排号信息 **/
    if (this.vm.order) {
      Column() {
        CommonShow({ title: '排号成功！' })

        List({ space: 25 }) {
          ListItem() {
            Row() {
              Image($r('app.media.ic_book_res_location')).width(24)
              Column({ space: 8 }) {
                Text(this.vm.order!.store.name).fontColor($r('sys.color.font_primary')).fontWeight(FontWeight.Medium)
                Text(this.vm.order!.store.location).fontSize(10).fontColor($r('sys.color.font_secondary'))
              }
              .layoutWeight(1)
              .margin({ left: $r('app.string.margin_8') })
              .alignItems(HorizontalAlign.Start)
            }
          }

          CommonListItem({ pic: $r('app.media.ic_book_order_time'), desc: '就餐时间', value: this.vm.order!.time })
          CommonListItem({
            pic: $r('app.media.ic_book_order_count'),
            desc: '就餐人数',
            value: this.vm.order!.count + '人',
          })
          
          ListItem() {
            this.queueInfoBuilder();
          }
        }
        .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
        .padding({ top: 16, left: 12, right: 12 })
        .height(291)
        .backgroundImage($r('app.media.ic_book_res_bg1'))
        .backgroundImageSize({ width: '100%', height: '100%' })

        Row() {
          Image($r('app.media.ic_book_res_bg2')).width(276).height(8)
        }.position({ top: 112 }).justifyContent(FlexAlign.Center).width(CommonConstants.FULL_WIDTH)
      }
    }

    Blank().layoutWeight(1)
  }

  @Builder
  queueInfoBuilder() {
    Column({ space: 12 }) {
      // 刷新排号,不使用简单类型的带参Builder
      Row() {
        Image($r('app.media.ic_queue_order_tips')).width(24).margin({ right: $r('app.string.margin_8') })
        Text('我的号码').layoutWeight(1).fontSize(14).fontColor($r('sys.color.font_secondary'))
        Text(this.vm.order!.mine + '号')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.font_primary'))
      }

      Row() {
        Blank().width(24).margin({ right: $r('app.string.margin_8') })
        Text('当前叫号').layoutWeight(1).fontSize(14).fontColor($r('sys.color.font_secondary'))
        Text(this.vm.type + this.vm.order!.now + '号')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.font_primary'))
      }

      Row() {
        Blank().width(24).margin({ right: $r('app.string.margin_8') })
        Text('等待桌数').layoutWeight(1).fontSize(14).fontColor($r('sys.color.font_secondary'))
        Text(this.vm.order!.wait + '桌')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.font_primary'))
      }
    }.layoutWeight(1)
  }

  @Builder
  queueResBottomUiBuilder() {
    Row() {
      Text('刷新排号')
        .fontSize(14)
        .fontColor($r('app.color.brand_red'))
        .onClick(async () => {
          this.vm.refreshQueueOrder();
        })
      Text('|')
        .fontSize(12)
        .width(12)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.font_primary'))
        .margin({ left: $r('app.string.margin_8'), right: $r('app.string.margin_8') })
      Text('取消排号')
        .fontSize(14)
        .fontColor($r('sys.color.font_secondary'))
        .onClick(async () => {
          this.vm.cancelQueueOrder(this.vm.order!.orderId);
        })
    }
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
  }
}

@Builder
export function queueResPageBuilder() {
  QueueResPage()
}