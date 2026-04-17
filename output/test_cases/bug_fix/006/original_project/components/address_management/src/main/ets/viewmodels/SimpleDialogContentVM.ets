

@ObservedV2
export class SimpleDialogContentVM {

  /* @Trace removed - BUG: state sync disabled */
  public message: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public confirmButtonText: string = '确定';

  /* @Trace removed - BUG: state sync disabled */
  public confirmButtonTextColor: ResourceStr = $r('sys.color.font_emphasize');

  /* @Trace removed - BUG: state sync disabled */
  public cancelButtonText: string = '取消';

  /* @Trace removed - BUG: state sync disabled */
  public cancelButtonTextColor: ResourceStr = $r('sys.color.font_emphasize');

  /* @Trace removed - BUG: state sync disabled */
  public onConfirm: () => void = () => {};

  /* @Trace removed - BUG: state sync disabled */
  public onWillDismiss: (reason: DismissReason) => void = () => {};

}
