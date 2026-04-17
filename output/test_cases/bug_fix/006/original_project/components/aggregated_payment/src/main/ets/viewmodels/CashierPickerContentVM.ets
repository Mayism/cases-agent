import { PaymentType } from '../common/CustomTypes';

@ObservedV2
export class CashierPickerContentVM {

  /* @Trace removed - BUG: state sync disabled */
  public durationForAppear: number = 270;

  /* @Trace removed - BUG: state sync disabled */
  public durationForDisappear: number = 220;

  /* @Trace removed - BUG: state sync disabled */
  public amount: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  public tradeSummary: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public isOpen: boolean = false;

  /* @Trace removed - BUG: state sync disabled */
  public selectType: PaymentType = PaymentType.HUAWEI;

  /* @Trace removed - BUG: state sync disabled */
  public payment: (type: PaymentType) => void | Promise<void> = () => {};

  /* @Trace removed - BUG: state sync disabled */
  public willDismiss: (reason: DismissReason) => void = () => {};

  public reset(): void {
    this.amount = 0;
    this.tradeSummary = '';
    this.selectType = PaymentType.HUAWEI;
  }
}
