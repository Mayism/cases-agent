import { UISkeleton } from '@hw-agconnect/ui-skeleton';
import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { StoreInfo } from '../../network/types/ResponseTypes';
import { Dialog } from '../../utils/Dialog';
import { formatDistance } from '../../utils/Format';
import { QueueVM } from '../../viewmodels/QueueVM';

@ComponentV2
export struct QueueStoreListCom {
  vm: QueueVM = QueueVM.instance;

  aboutToAppear(): void {
    Dialog.init(this.getUIContext());
  }

  build() {
    Column() {
      if (!this.vm.searching && this.vm.searchStoreList.length) {
        List({ space: 12 }) {
          ForEach(this.vm.searchStoreList, (store: StoreInfo) => {
            ListItem() {
              this.storeItemBuilder(store)
            }
          }, (store: StoreInfo, index) => JSON.stringify(store) + '_' + index)
        }
        .listStyle()
      }

      if (!this.vm.searching && !this.vm.searchStoreList.length) {
        this.nullBuilder()
      }

      if (this.vm.searching) {
        this.skeletonListBuilder()
      }
    }
  }

  @Builder
  storeItemBuilder(store: StoreInfo) {
    Row({ space: 30 }) {
      Column({ space: 4 }) {
        Row({ space: 8 }) {
          Text(store.name)
            .fontSize(14)
            .lineHeight(19)
            .fontColor($r('sys.color.font_primary'))
            .fontWeight(FontWeight.Medium)
          Text('距您' + formatDistance(store.distance)).fontSize(10).fontColor($r('sys.color.font_primary'))
        }

        Text(store.location).fontSize(10).fontColor($r('sys.color.font_secondary')).height(14)
      }.alignItems(HorizontalAlign.Start).layoutWeight(1).justifyContent(FlexAlign.Center)

      Text(store.needQueue ? '排号' : '无需排号')
        .borderRadius($r('app.string.border_radius_8'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.system_color_background_white'))
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .backgroundColor(store.needQueue ? $r('app.color.brand_red') : $r('sys.color.font_secondary'))
        .width(56)
        .height(28)
        .onClick(() => {
          this.vm.jumpToQueueOrder(store);
        })
    }
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  nullBuilder() {
    Column() {
      Image($r('app.media.ic_store_null')).width(120).height(120)
      Text('暂无门店信息')
        .fontColor($r('sys.color.font_secondary'))
        .fontSize($r('sys.float.Subtitle_S'))
        .lineHeight(19)
        .padding({ bottom: 17 })
    }
    .alignItems(HorizontalAlign.Center)
    .attributeModifier(CONTAINER_STYLE)
  }

  @Builder
  skeletonListBuilder() {
    List({ space: 12 }) {
      ForEach(Array.from({ length: 8 }), () => {
        ListItem() {
          Row() {
            Row() {
              UISkeleton({
                loading: true,
                duration: 600,
                spaceCol: 4,
                alignCol: FlexAlign.Center,
                options: [
                  { width: '60%', height: 16 },
                  { width: '80%', height: 12 },
                ],
              })
            }.layoutWeight(1)

            Row() {
              UISkeleton({
                loading: true,
                duration: 600,
                alignCol: FlexAlign.Center,
                options: [{ width: 56, height: 28, radius: 8 }],
              })
            }.width(56)
          }
        }.height(56).attributeModifier(CONTAINER_STYLE)
      }, (item: null, index) => index.toString())
    }
    .listStyle()
  }
}

@Extend(List)
function listStyle() {
  .scrollBar(BarState.Off)
  .width(CommonConstants.FULL_WIDTH)
}