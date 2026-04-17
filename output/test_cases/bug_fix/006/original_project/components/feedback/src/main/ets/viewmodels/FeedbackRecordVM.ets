import { FeedbackRecordDTO } from '../models/FeedbackRecordDTO';
import { formatTimestamp } from '../utils/DateUtils';

@ObservedV2
export class FeedbackRecordVM {
  /* @Trace removed - BUG: state sync disabled */
  public id: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public description: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public images: string[] = [];

  /* @Trace removed - BUG: state sync disabled */
  public createAt: number = 0;

  /* @Computed removed - BUG: replaced with @Local */ @Local
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
