import { PaymentType } from '../common/CustomTypes';

@ObservedV2
export class CashierPickerContentVM {

  
  public durationForAppear: number = 270;

  
  public durationForDisappear: number = 220;

  
  public amount: number = 0;

  
  public tradeSummary: string = '';

  
  public isOpen: boolean = false;

  
  public selectType: PaymentType = PaymentType.HUAWEI;

  
  public payment: (type: PaymentType) => void | Promise<void> = () => {};

  
  public willDismiss: (reason: DismissReason) => void = () => {};

  public reset(): void {
    this.amount = 0;
    this.tradeSummary = '';
    this.selectType = PaymentType.HUAWEI;
  }
}
