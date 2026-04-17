import { AddressVM } from './AddressVM';
import { Operation } from '../common/CustomTypes';

@ObservedV2
export class AddressFormSheetContext {

  /* @Trace removed - BUG: state sync disabled */
  public title: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public address: AddressVM = new AddressVM();

  /* @Trace removed - BUG: state sync disabled */
  public operation: Operation = Operation.EDIT;

  /* @Trace removed - BUG: state sync disabled */
  public isOpen: boolean = false;

  /* @Trace removed - BUG: state sync disabled */
  public sheetType: SheetType = SheetType.BOTTOM;

  /* @Trace removed - BUG: state sync disabled */
  public onWillSpringBackWhenDismiss: Callback<SpringBackAction> = (action: SpringBackAction) => action.springBack();

  /* @Trace removed - BUG: state sync disabled */
  public onWillDismiss: (reason: DismissReason, hasChange: boolean) => void = () => {};

  /* @Trace removed - BUG: state sync disabled */
  public onAddressListUpdate: Callback<void> = () => {};

  /* @Trace removed - BUG: state sync disabled */
  public close: () => void = () => {};

}
