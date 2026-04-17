import { CommonShow } from '../../components/common/CommonShow';
import { CommonPage } from '../../components/common/CommonPage';
import { CommonConstants, RouterMap } from '../../constants/Common';
import { GenderStatus } from '../../types/Types';
import { CalenderUtil } from '../../utils/CalenderUtil';
import { formatPhoneNumber } from '../../utils/Format';
import { OrderUtil } from '../../utils/OrderUtil';
import { RouterModule } from '../../utils/RouterModule';
import { BookVM } from '../../viewmodels/BookVM';
import { CommonListItem } from '../../components/common/CommonListItem';

@ComponentV2
export struct BookResPage {
  vm: BookVM = BookVM.instance;

  aboutToAppear(): void {
    CalenderUtil.init(getContext());
    const orderId: number = RouterModule.getNavParam({ url: RouterMap.BOOK_RES_PAGE }) as number;
    this.vm.order = OrderUtil.getBookOrderById(getContext(), orderId);
  }

  build() {
    CommonPage({
      title: '预订成功',
      mainUi: () => {
        this.bookResMainUiBuilder();
      },
      bottomUi: () => {
        this.bookResBottomUiBuilder();
      },
    })
  }

  @Builder
  bookResMainUiBuilder() {
    /** 订座信息 **/
    if (this.vm.order) {
      Column() {
        CommonShow({ title: '订座成功！' })

        List({ space: 24 }) {
          ListItem() {
            Row() {
              Image($r('app.media.ic_book_order_location')).width(24)
              Column({ space: 8 }) {
                Text(this.vm.order!.store.name).fontColor($r('sys.color.font_primary')).fontWeight(FontWeight.Medium)
                Text(this.vm.order!.store.location).fontSize(10).fontColor($r('sys.color.font_secondary'))
              }
              .layoutWeight(1)
              .margin({ left: $r('app.string.margin_8') })
              .alignItems(HorizontalAlign.Start)
            }
          }

          CommonListItem({
            pic: $r('app.media.ic_book_order_people'),
            desc: '订座人',
            value: this.vm.order!.name + (this.vm.order!.gender === GenderStatus.MALE ? '先生' : '女士'),
          })

          CommonListItem({
            pic: $r('app.media.ic_book_order_cellphone'),
            desc: '联系方式',
            value: formatPhoneNumber(this.vm.order!.phone),
          })

          CommonListItem({
            pic: $r('app.media.ic_book_order_count'),
            desc: '就餐人数',
            value: this.vm.order!.count + '人',
          })
          CommonListItem({
            pic: $r('app.media.ic_book_order_room'),
            desc: '是否预订包间',
            value: this.vm.order!.room ? '是' : '否',
          })

          CommonListItem({
            pic: $r('app.media.ic_book_order_time'),
            desc: '就餐时间',
            value: this.vm.order!.time,
          })
        }
        .padding({ top: 20, left: 12, right: 12 })
        .height(333)
        .backgroundImage($r('app.media.ic_book_res_bg1'))
        .backgroundImageSize({ width: '100%', height: '100%' })
        .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })

        Row() {
          Image($r('app.media.ic_book_res_bg2')).width(276).height(8)
        }.position({ top: 112 }).justifyContent(FlexAlign.Center).width(CommonConstants.FULL_WIDTH)
      }
    }

    Blank().layoutWeight(1)
  }

  @Builder
  bookResBottomUiBuilder() {
    Row() {
      Text('预约日历')
        .fontSize(14)
        .fontColor($r('app.color.brand_red'))
        .onClick(() => {
          CalenderUtil.addCalenderEvent(this.vm.order!);
        })
      Text('|')
        .fontSize(12)
        .width(12)
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.font_primary'))
        .margin({ left: $r('app.string.margin_8'), right: $r('app.string.margin_8') })
      Text('取消订座')
        .fontSize(14)
        .fontColor($r('sys.color.font_secondary'))
        .onClick(async () => {
          await this.vm.cancelBookOrder(this.vm.order!.orderId);
        })
    }
    .width(CommonConstants.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
  }
}

@Builder
export function bookResPageBuilder() {
  BookResPage()
}