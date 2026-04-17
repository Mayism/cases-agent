import { IngredientItem } from '../types/Index'
import { IngredientList } from './IngredientList'

@ComponentV2
export struct PurchaseIngredients {
  @Param @Require todoList: IngredientItem[]
  @Param @Require finishedList: IngredientItem[]
  @Param index: number = 9999
  @Param isAllTab: boolean = false
  @Local isExpand: boolean = true
  @Event todoCb: (item: IngredientItem) => void = () => {
  }
  @Event finishedCb: (item: IngredientItem) => void = () => {
  }

  build() {
    Column() {
      IngredientList({
        list: this.todoList,
        isFinished: false,
        index: this.index,
        isAllTab: this.isAllTab,
        callback: (item: IngredientItem) => {
          this.todoCb(item)
        },
      })
      Row() {
        Row() {
          Text('已完成').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#E84026')
          Text(this.finishedList.length.toString())
            .fontSize(10)
            .fontColor($r('sys.color.font_on_primary'))
            .padding({
              top: 1,
              bottom: 1,
              left: 6,
              right: 6,
            })
            .backgroundColor('#E84026')
            .margin({ left: 12 })
            .borderRadius(8)
        }

        Image(this.isExpand ? $r('app.media.ic_expand') : $r('app.media.ic_collect'))
          .width(20)
          .height(20)
          .onClick(() => {
            this.isExpand = !this.isExpand
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 12 })

      IngredientList({
        list: this.finishedList,
        isFinished: true,
        index: this.index,
        callback: (item: IngredientItem) => {
          this.finishedCb(item)
        },
      }).visibility(this.isExpand ? Visibility.Visible : Visibility.None)
    }
  }
}