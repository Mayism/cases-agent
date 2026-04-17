class ButtonConstant {
  // 背景颜色
  static readonly BG_COLOR: ResourceColor = '#DD4737';
  // 按钮高度
  static readonly HEIGHT: Length = 40;
  // 标题字体大小
  static readonly TITLE_SIZE: Length = $r('sys.float.Body_L');
  // 标题字体颜色
  static readonly FONT_COLOR: ResourceColor = $r('sys.color.font_on_primary');
}

@ComponentV2
export struct CommonButton {
  // 按钮文字
  @Param title: string = '';
  // 按钮操作
  @Event handleClick: () => void;

  build() {
    Button(this.title)
      .width('calc(100% - 56vp)')
      .fontWeight(FontWeight.Medium)
      .height(ButtonConstant.HEIGHT)
      .fontSize(ButtonConstant.TITLE_SIZE)
      .fontColor(ButtonConstant.FONT_COLOR)
      .backgroundColor(ButtonConstant.BG_COLOR)
      .onClick(() => {
        this.handleClick();
      })
  }
}