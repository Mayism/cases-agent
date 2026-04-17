@ComponentV2
export struct CommonButton {
  @Param title: string = '';
  @Event handleClick: () => void;

  build() {
    Button(this.title)
      .fontWeight(FontWeight.Medium)
      .height(ButtonStyle.HEIGHT)
      .fontSize(ButtonStyle.TITLE_SIZE)
      .fontColor(ButtonStyle.FONT_COLOR)
      .backgroundColor(ButtonStyle.BG_COLOR)
      .width('calc(100% - 56vp)')
      .onClick(() => {
        this.handleClick();
      })
  }
}

export class ButtonStyle {
  static readonly BG_COLOR: ResourceColor = '#DD4737';
  static readonly HEIGHT: Length = 40;
  static readonly TITLE_SIZE: Length = $r('sys.float.Body_L');
  static readonly FONT_COLOR: ResourceColor = $r('sys.color.font_on_primary');
}