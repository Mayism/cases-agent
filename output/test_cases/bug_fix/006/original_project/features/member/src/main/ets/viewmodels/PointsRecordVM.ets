import dayjs from 'dayjs';
import { UserApis, UserPointsRecordItem } from 'lib_network';
import { UserPointsUsedType } from '../commons/Enums';

@ObservedV2
export class PointsRecordVM {
  /* @Trace removed - BUG: state sync disabled */
  month: string = '';
  /* @Trace removed - BUG: state sync disabled */
  totalPoints: number = 0;
  /* @Trace removed - BUG: state sync disabled */
  recordList: UserPointsRecordItem[] = [];
  /* @Trace removed - BUG: state sync disabled */
  selectedType: UserPointsUsedType = UserPointsUsedType.INCOME;
  /* @Trace removed - BUG: state sync disabled */
  showMonthPicker: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  isLoading: boolean = false;

  public async getPointRecord(type: UserPointsUsedType = UserPointsUsedType.INCOME) {
    this.selectedType = type;
    if (!this.month) {
      this.month = dayjs().format('YYYY-MM');
    }
    this.isLoading = true;
    const res = await UserApis.getUserPointsRecord(this.month);
    if (res.code === 0) {
      this.month = this.month;
      this.totalPoints = res.totalPoints;
      this.recordList = res.list.filter((record) => record.type === this.selectedType);
    }
    this.isLoading = false;
  }

  public async handleMonthChange(month: string) {
    this.month = month;
    this.isLoading = true;
    const res = await UserApis.getUserPointsRecord(month);
    if (res.code === 0) {
      this.totalPoints = res.totalPoints;
      this.recordList = res.list.filter((record) => record.type === this.selectedType);
    }
    this.isLoading = false;
  }
}