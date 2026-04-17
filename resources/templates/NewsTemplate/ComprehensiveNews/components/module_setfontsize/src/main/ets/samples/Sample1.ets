import { SettingFontCore } from '../views/SettingFontCore'

@Entry
@ComponentV2
struct SettingFont {
  @Local currentRatio: number = 1;

  build() {
    NavDestination() {
      SettingFontCore({
        currentRatio: this.currentRatio,
        confirm: (ratio: number) => {
          this.currentRatio = ratio;
          this.getUIContext().getPromptAction().showToast({
            message: '字号设置已成功'
          });
        },
      })
        .layoutWeight(1)
    }
    .title('字体大小')
    .backgroundColor($r('sys.color.background_secondary'))
  }
}