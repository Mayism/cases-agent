import dayjs from 'dayjs';
import { UserApis, UserPointsRecordItem } from 'lib_network';
import { UserPointsUsedType } from '../commons/Enums';

@ObservedV2
export class PointsRecordVM {
  month: string = '';
  totalPoints: number = 0;
  recordList: UserPointsRecordItem[] = [];
  selectedType: UserPointsUsedType = UserPointsUsedType.INCOME;
  showMonthPicker: boolean = false;
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