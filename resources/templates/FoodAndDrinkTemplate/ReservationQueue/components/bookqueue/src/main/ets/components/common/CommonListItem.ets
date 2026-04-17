@ComponentV2
export struct CommonListItem {
  @Param pic: ResourceStr = '';
  @Param desc: string = '';
  @Param value: string = '';

  build() {
    ListItem() {
      Row() {
        Image(this.pic).width(24)
        Text(this.desc)
          .layoutWeight(1)
          .fontSize(14)
          .fontColor($r('sys.color.font_secondary'))
          .margin({ left: $r('app.string.margin_8') })
        Text(this.value)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('sys.color.font_primary'))
      }
    }
  }
}