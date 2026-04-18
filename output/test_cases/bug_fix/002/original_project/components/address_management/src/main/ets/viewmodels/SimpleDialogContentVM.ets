

@ObservedV2
export class SimpleDialogContentVM {
  public message: string = '';
  public confirmButtonText: string = '确定';
  public confirmButtonTextColor: ResourceStr = $r('sys.color.font_emphasize');
  public cancelButtonText: string = '取消';
  public cancelButtonTextColor: ResourceStr = $r('sys.color.font_emphasize');
  public onConfirm: () => void = () => {};
  public onWillDismiss: (reason: DismissReason) => void = () => {};

}
