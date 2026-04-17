import { CommonConstants } from '../../constants/Common';
import { CHOOSE_NUM, CHOOSE_TIME, WEEK_DAYS } from '../../constants/Constants';
import { CONTAINER_STYLE } from '../../constants/Styles';
import { formatDateToMonthDay } from '../../utils/Format';
import { BookVM } from '../../viewmodels/BookVM';
import { CommonSheet } from '../common/CommonSheet';

@ComponentV2
export struct BookFilterListCom {
  vm: BookVM = BookVM.instance;

  build() {
    List({ space: 25 }) {

      ListItem() {
        Row() {
          Image($r('app.media.ic_book_time')).width(24).margin({ right: $r('app.string.margin_8') })
          Text('预订时间').descTextStyle()
          Row({ space: 4 }) {
            Text(this.vm.timeStr).valueTextStyle()
            Image($r('app.media.ic_right_arrow')).width(16)
          }.onClick(() => {
            this.vm.showTime = true;
          })
        }
      }.bindSheet($$this.vm.showTime, this.timeBindSheetBuilder, { height: SheetSize.FIT_CONTENT })

      ListItem() {
        Row() {
          Image($r('app.media.ic_book_people')).width(24).margin({ right: $r('app.string.margin_8') })
          Text('预订就餐人数').descTextStyle()
          Row({ space: 4 }) {
            Text(this.vm.headCount + '人').valueTextStyle()
            Image($r('app.media.ic_right_arrow')).width(16)
          }.onClick(() => {
            this.vm.showCount = true;
          })
        }
      }.bindSheet($$this.vm.showCount, this.countBindSheetBuilder, { height: SheetSize.FIT_CONTENT })

      ListItem() {
        Row() {
          Image($r('app.media.ic_book_room')).width(24).margin({ right: $r('app.string.margin_8') })
          Text('预订包间').descTextStyle()
          Toggle({ type: ToggleType.Switch, isOn: $$this.vm.isPrivateRoom }).size({ height: 20, width: 36 })
        }
      }

    }
    .divider({ strokeWidth: 1, color: $r('sys.color.comp_divider') })
    .attributeModifier(CONTAINER_STYLE)
    .bindSheet(true, this.initBindSheetBuilder, { height: SheetSize.FIT_CONTENT })
  }

  @Builder
  initBindSheetBuilder() {
    Column({ space: 22 }) {
      Text('筛选')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width(CommonConstants.FULL_WIDTH)
        .fontColor($r('sys.color.font_primary'))
        .padding({ left: $r('app.string.padding_16') })

      Column({ space: 16 }) {

        List({ space: 12 }) {
          ForEach(CHOOSE_NUM, (num: number, index) => {
            ListItem() {
              Text(num + '人')
                .fontSize(12)
                .fontColor(this.vm.filterIndexes[0] === index ?
                $r('app.color.system_color_background_white') : $r('sys.color.font_primary'))
            }
            .onClick(() => {
              this.vm.filterIndexes[0] = index;
            })
            .width(60)
            .height(28)
            .borderRadius($r('app.string.border_radius_8'))
            .backgroundColor(this.vm.filterIndexes[0] === index ?
            $r('app.color.brand_red') : '#E9E9E9')
          }, (num: number, index) => num + '' + index)
        }.listStyle()

        List({ space: 12 }) {
          ForEach(this.vm.dates, (date: Date, index) => {
            ListItem() {
              Column() {
                Text(formatDateToMonthDay(date, index))
                  .fontSize(12)
                  .fontColor(this.vm.filterIndexes[1] === index ?
                  $r('app.color.system_color_background_white') : $r('sys.color.font_primary'))
                Text(WEEK_DAYS[date.getDay()])
                  .fontSize(12)
                  .fontColor(this.vm.filterIndexes[1] === index ?
                  $r('app.color.system_color_background_white') : $r('sys.color.font_secondary'))
              }
              .padding($r('app.string.padding_6'))
              .height(CommonConstants.FULL_HEIGHT)
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .onClick(() => {
              this.vm.filterIndexes[1] = index;
              if (this.vm.filterIndexes[1] === 0 && isTimeEarlier(CHOOSE_TIME[0][1])) {
                this.vm.filterIndexes[2] = this.vm.filterIndexes[2] || 3;
              }
            })
            .width(60)
            .height(47)
            .borderRadius($r('app.string.border_radius_8'))
            .backgroundColor(this.vm.filterIndexes[1] === index ?
            $r('app.color.brand_red') : '#E9E9E9')
          }, (num: number, index) => num + '' + index)
        }.listStyle()

        List({ space: 12 }) {
          ForEach(CHOOSE_TIME, (time: [string, string], index) => {
            PeriodItemCom({ time: time, index: index })
          }, (num: number, index) => num + '' + index)
        }.listStyle()

        Row({ space: 4 }) {
          Text('预订包间').fontSize(12).fontColor($r('sys.color.font_secondary'))
          Toggle({ type: ToggleType.Switch, isOn: $$this.vm.isPrivateRoom }).size({ height: 20, width: 36 })
        }
        .width(CommonConstants.FULL_WIDTH)
        .padding({ left: $r('app.string.padding_16') })
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .padding({ top: 32, bottom: 32 })
  }

  @Builder
  timeBindSheetBuilder() {
    CommonSheet({
      title: '时间选择',
      cancel: () => {
        this.vm.showTime = false;
      },
      confirm: () => {
        this.vm.confirmPickerTime();
      },
    }) {
      Row() {
        TextPicker({ range: this.vm.datesRange, selected: $$this.vm.tempDayIndex })
          .selectedTextStyle({ color: $r('app.color.brand_red') })
        TimePicker({ format: TimePickerFormat.HOUR_MINUTE, selected: this.vm.timeDate }).layoutWeight(1)
          .selectedTextStyle({ color: $r('app.color.brand_red') })
          .useMilitaryTime(false)
          .onChange(value => {
            this.vm.timeRes = value;
          })
      }
      .height(200)
    }
  }

  @Builder
  countBindSheetBuilder() {
    CommonSheet({
      title: '人数选择',
      cancel: () => {
        this.vm.tempCountIndex = this.vm.filterIndexes[0];
        this.vm.showCount = false;
      },
      confirm: () => {
        this.vm.filterIndexes[0] = this.vm.tempCountIndex;
        this.vm.showCount = false;
      },
    }) {
      TextPicker({ range: this.vm.countRange, selected: $$this.vm.tempCountIndex })
        .selectedTextStyle({ color: $r('app.color.brand_red') })
        .divider({
          strokeWidth: 1,
          startMargin: 98,
          endMargin: 98,
          color: '#eac4b9',
        })
        .height(200)
        .width(CommonConstants.FULL_WIDTH)
    }
  }
}

@Extend(Text)
function descTextStyle() {
  .fontSize(14)
  .fontColor($r('sys.color.font_secondary'))
  .layoutWeight(1)
}

@Extend(Text)
function valueTextStyle() {
  .fontSize(14)
  .fontColor($r('sys.color.font_primary'))
}

@Extend(List)
function listStyle() {
  .width(CommonConstants.FULL_WIDTH)
  .contentStartOffset(16)
  .contentEndOffset(16)
  .listDirection(Axis.Horizontal)
  .scrollBar(BarState.Off)
}

@ComponentV2
export struct PeriodItemCom {
  @Require @Param time: string[];
  @Require @Param index: number;
  vm: BookVM = BookVM.instance;

  @Computed
  get bgColor() {
    if (this.vm.filterIndexes[1] === 0 && isTimeEarlier(this.time[1])) {
      return '#E8EAEB';
    }
    return this.vm.filterIndexes[2] === this.index ? $r('app.color.brand_red') : '#E9E9E9';
  }

  @Computed
  get textColor() {
    if (this.vm.filterIndexes[1] === 0 && isTimeEarlier(this.time[1])) {
      return $r('sys.color.font_tertiary');
    }
    return this.vm.filterIndexes[2] === this.index ?
    $r('app.color.system_color_background_white') : $r('sys.color.font_primary');
  }

  build() {
    ListItem() {
      Text(this.time[0] + '-' + this.time[1])
        .fontSize(12)
        .fontColor(this.textColor)
    }
    .onClick(() => {
      if (this.vm.filterIndexes[1] !== 0 || !isTimeEarlier(this.time[1])) {
        this.vm.filterIndexes[2] = this.index;
      }
    })
    .width(78)
    .height(28)
    .borderRadius($r('app.string.border_radius_8'))
    .backgroundColor(this.bgColor)
  }
}

function isTimeEarlier(timeStr: string): boolean {
  const currentTime = new Date();
  const timeArr = timeStr.split(':');
  const hours = Number(timeArr[0]);
  const minutes = Number(timeArr[1]);
  const targetTime =
    new Date(currentTime.getFullYear(), currentTime.getMonth(), currentTime.getDate(), hours, minutes);
  return targetTime < currentTime;
}