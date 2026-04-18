import { FeedbackRecordDTO } from '../models/FeedbackRecordDTO';
import { formatTimestamp } from '../utils/DateUtils';

@ObservedV2
export class FeedbackRecordVM {
  public id: string = '';
  public description: string = '';
  public images: string[] = [];
  public createAt: number = 0;

  @Local
  public get displayDate(): string {
    return formatTimestamp(this.createAt);
  }

  public assignFromDTO(record: FeedbackRecordDTO): void {
    this.id = record.id ?? '';
    this.description = record.description ?? '';
    this.images = record.images ?? [];
    this.createAt = record.createAt ?? 0;
  }
}
