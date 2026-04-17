/**
 * 设置页面 - 展示 Toggle 点击后立即状态变更的缺陷场景
 * 
 * 问题现象：
 * - Toggle 开关点击后立即生效，没有任何延迟或确认机制
 * - 用户无法反悔或撤销操作
 * - 误操作可能导致重要功能意外开启/关闭
 * 
 * 修复目标：
 * - 实现 Toggle 点击后延迟改变状态
 * - 提供确认对话框或撤销机制
 * - 状态变更前提供视觉过渡反馈
 */

@ObservedV2
class SettingsModel {
  @Trace autoSync: boolean = false;       // 自动同步
  @Trace privacyMode: boolean = false;    // 隐私模式
  @Trace pushNotification: boolean = true; // 推送通知
  @Trace darkMode: boolean = false;       // 深色模式
}

@ComponentV2
export struct SettingsPage {
  @Consumer('navPathStack') navPathStack: NavPathStack;
  @Local settings: SettingsModel = new SettingsModel();

  build() {
    NavDestination() {
      Column() {
        // 标题
        Text('设置')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1A1A1A')
          .margin({ top: 24, bottom: 24 })

        // 设置项列表
        List() {
          ListItem() {
            SettingItem({
              title: '自动同步',
              desc: '开启后将自动同步您的数据到云端',
              isOn: this.settings.autoSync,
              onToggle: (value: boolean) => {
                // 问题代码：直接修改状态，没有任何延迟或确认
                this.settings.autoSync = value;
                // 立即触发同步操作
                if (value) {
                  console.info('自动同步已开启，开始同步数据...');
                } else {
                  console.info('自动同步已关闭，停止同步');
                }
              }
            })
          }

          ListItem() {
            SettingItem({
              title: '隐私模式',
              desc: '开启后将隐藏您的敏感信息',
              isOn: this.settings.privacyMode,
              onToggle: (value: boolean) => {
                // 问题代码：直接修改状态，用户无法撤销
                this.settings.privacyMode = value;
                // 立即切换隐私状态
                if (value) {
                  console.info('隐私模式已开启');
                } else {
                  console.info('隐私模式已关闭，信息将公开显示');
                }
              }
            })
          }

          ListItem() {
            SettingItem({
              title: '推送通知',
              desc: '接收应用推送的消息通知',
              isOn: this.settings.pushNotification,
              onToggle: (value: boolean) => {
                // 问题代码：立即生效，可能导致用户错过重要通知
                this.settings.pushNotification = value;
                if (!value) {
                  console.info('推送通知已关闭，您将不再收到通知');
                }
              }
            })
          }

          ListItem() {
            SettingItem({
              title: '深色模式',
              desc: '切换应用显示模式',
              isOn: this.settings.darkMode,
              onToggle: (value: boolean) => {
                // 问题代码：立即切换，没有视觉过渡
                this.settings.darkMode = value;
                console.info(`深色模式: ${value ? '开启' : '关闭'}`);
              }
            })
          }
        }
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 1, color: '#E5E5E5', startMargin: 16, endMargin: 16 })

        // 底部提示
        Text('提示：当前开关点击后立即生效，无法撤销')
          .fontSize(12)
          .fontColor('#999999')
          .margin({ top: 16, bottom: 24 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5')
      .padding({ left: 16, right: 16 })
    }
    .title('设置')
    .hideTitleBar(false)
  }
}

@ComponentV2
struct SettingItem {
  @Param title: string = '';
  @Param desc: string = '';
  @Param isOn: boolean = false;
  @Param onToggle: (value: boolean) => void = () => {};

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1A1A1A')

        Text(this.desc)
          .fontSize(12)
          .fontColor('#999999')
          .margin({ top: 4 })
          .maxLines(2)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      // Toggle 开关 - 问题：onChange 立即执行状态更新
      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .selectedColor('#007AFF')
        .onChange((isOn: boolean) => {
          // 缺陷：直接调用 onToggle，没有任何延迟或确认机制
          this.onToggle(isOn);
        })
    }
    .width('100%')
    .padding({ top: 16, bottom: 16 })
    .backgroundColor('#FFFFFF')
    .borderRadius(8)
  }
}