import { AddressVM } from './AddressVM';
import { Operation } from '../common/CustomTypes';

@ObservedV2
export class AddressFormSheetContext {

  
  public title: string = '';

  
  public address: AddressVM = new AddressVM();

  
  public operation: Operation = Operation.EDIT;

  
  public isOpen: boolean = false;

  
  public sheetType: SheetType = SheetType.BOTTOM;

  
  public onWillSpringBackWhenDismiss: Callback<SpringBackAction> = (action: SpringBackAction) => action.springBack();

  
  public onWillDismiss: (reason: DismissReason, hasChange: boolean) => void = () => {};

  
  public onAddressListUpdate: Callback<void> = () => {};

  
  public close: () => void = () => {};

}
