import { CommonConstants } from '../../constants/Common';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { StoreInfo } from '../../network/types/ResponseTypes';
import { BookVM } from '../../viewmodels/BookVM';
import { BookStoreListItemCom, SkeletonListItemCom } from './BookStoreListItemCom';

@ComponentV2
export struct BookStoreListCom {
  vm: BookVM = BookVM.instance;

  build() {
    List({ space: 15 }) {
      ListItemGroup() {
        ListItem() {
          Row({ space: 2 }) {
            Image($r('app.media.ic_book_store')).width(24)
            Text('所有门店').fontSize(14).fontColor($r('sys.color.font_primary'))
          }
        }
      }

      if (!this.vm.searching && this.vm.searchStoreList.length) {
        ListItemGroup({ space: 25 }) {
          ForEach(this.vm.searchStoreList, (store: StoreInfo) => {
            ListItem() {
              BookStoreListItemCom({ store: store })
            }
          }, (store: StoreInfo, index) => JSON.stringify(store) + '_' + index)
        }
        .listStyle()
      } else if (!this.vm.searching && !this.vm.searchStoreList.length) {
        this.nullBuilder()
      }

      if (this.vm.searching) {
        ListItemGroup({ space: 25 }) {
          ForEach(Array.from({ length: 4 }), () => {
            ListItem() {
              SkeletonListItemCom()
            }
          }, (item: null, index) => index.toString())
        }
        .listStyle()
      }
    }
    .clip(true)
    .attributeModifier(CONTAINER_STYLE)
    .scrollBar(BarState.Off)
  }

  @Builder
  nullBuilder() {
    ListItem() {
      Column() {
        Image($r('app.media.ic_store_null')).width(120).height(120)
        Text('暂无门店信息')
          .fontColor($r('sys.color.font_secondary'))
          .fontSize($r('sys.float.Subtitle_S'))
          .lineHeight(19)
      }
      .width(CommonConstants.FULL_WIDTH)
      .alignItems(HorizontalAlign.Center)
      .padding({ bottom: 17 })
    }
  }
}

@Extend(ListItemGroup)
function listStyle() {
  .width(CommonConstants.FULL_WIDTH)
  .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
}