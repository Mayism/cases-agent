const storageLocal = new LocalStorage();

@Entry(storageLocal)
@Component
struct WidgetCard {
  @LocalStorageProp('order') order: QueueOrder = {
    orderId: 0,
    count: 0,
    mine: 0,
    now: 0,
    wait: 0,
  };
  readonly actionType: string = 'router';
  readonly abilityName: string = 'EntryAbility';

  getType(count: number) {
    if (count < 4) {
      return '小桌';
    } else if (count < 7) {
      return '中桌';
    } else {
      return '大桌';
    }
  }

  btClick(isRouter: boolean) {
    if (!isRouter) {
      postCardAction(this, {
        action: 'message',
        abilityName: this.abilityName,
        params: {
          orderId: this.order.orderId,
        },
      });
      return;
    }
    postCardAction(this, {
      action: 'router',
      abilityName: this.abilityName,
      params: {
        url: 'QueuePage',
        orderId: this.order.orderId,
      },
    });
  }

  build() {
    RelativeContainer() {
      if (!this.order.orderId) {
        this.nullBuilder()
      } else if (this.order.wait > 0) {
        this.queueBuilder()
      } else if (this.order.wait === 0) {
        this.callBuilder()
      } else {
        this.expireBuilder()
      }
    }
    .backgroundImage($r('app.media.ic_widget_bg'))
    .backgroundImageSize({ width: '100%', height: '100%' })
    .padding(12)
    .onClick(() => {
      if (this.order?.orderId) {
        postCardAction(this, {
          action: 'router',
          abilityName: this.abilityName,
          params: {
            url: 'QueueResPage',
            orderId: this.order.orderId,
          },
        });
      }
    })
  }

  @Builder
  nullBuilder() {
    Row({ space: 12 }) {
      Image($r('app.media.ic_widget_logo')).width(20)
      Text('暂无排队')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.system_color_background_white'))
    }
    .alignRules({
      'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Text('无需等待')
      .fontWeight(FontWeight.Bold)
      .fontSize(24)
      .fontColor($r('app.color.system_color_background_white'))
      .alignRules({
        'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
        'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
      })

    Text('前往排号').btnStyle().onClick(() => {
      this.btClick(true);
    }).alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'right': { 'anchor': '__container__', 'align': HorizontalAlign.End },
    })
  }

  @Builder
  queueBuilder() {
    Column({ space: 7 }) {
      Row({ space: 12 }) {
        Image($r('app.media.ic_widget_logo')).width(20)
        Text('排队中 | ' + this.getType(this.order!.count) + this.order!.mine + '号')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.system_color_background_white'))
      }

      Text('预计等待 ' + this.order!.wait * 5 + ' 分钟').padding({ left: 28 })
        .fontSize(14)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Column({ space: 4 }) {
      Text('还需等待').fontSize(12).fontColor($r('app.color.system_color_background_white'))
      Text(this.order!.wait + '桌')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Text('取消排号').btnStyle().onClick(() => {
      this.btClick(false);
    }).alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'right': { 'anchor': '__container__', 'align': HorizontalAlign.End },
    })
  }

  @Builder
  callBuilder() {
    Column({ space: 7 }) {
      Row({ space: 12 }) {
        Image($r('app.media.ic_widget_logo')).width(20)
        Text('叫号中')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.system_color_background_white'))
      }

      Text('预计等待 0 分钟').padding({ left: 28 })
        .fontSize(14)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Column({ space: 4 }) {
      Text('入场').fontSize(12).fontColor($r('app.color.system_color_background_white'))
      Text(this.getType(this.order!.count) + this.order!.mine + '号')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Text('取消排号').btnStyle().onClick(() => {
      this.btClick(false);
    }).alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'right': { 'anchor': '__container__', 'align': HorizontalAlign.End },
    })
  }

  @Builder
  expireBuilder() {
    Column({ space: 7 }) {
      Row({ space: 12 }) {
        Image($r('app.media.ic_widget_logo')).width(20)
        Text('已过号')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.system_color_background_white'))
      }

      Text('请联系商家重新排队').padding({ left: 28 })
        .fontSize(14)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'top': { 'anchor': '__container__', 'align': VerticalAlign.Top },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Column({ space: 4 }) {
      Text('建议').fontSize(12).fontColor($r('app.color.system_color_background_white'))
      Text('请重新取号')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.system_color_background_white'))
    }.alignItems(HorizontalAlign.Start)
    .alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start },
    })

    Text('重新排号').btnStyle().onClick(() => {
      this.btClick(true);
    }).alignRules({
      'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
      'right': { 'anchor': '__container__', 'align': HorizontalAlign.End },
    })
  }
}

@Extend(Text)
function btnStyle() {
  .width(80)
  .height(28)
  .borderRadius('50%')
  .backgroundColor($r('app.color.system_color_background_white'))
  .fontColor($r('app.color.brand_red'))
  .fontSize(12)
  .textAlign(TextAlign.Center)
}

export interface QueueOrder {
  orderId: number;
  count: number;
  mine: number;
  now: number;
  wait: number;
}