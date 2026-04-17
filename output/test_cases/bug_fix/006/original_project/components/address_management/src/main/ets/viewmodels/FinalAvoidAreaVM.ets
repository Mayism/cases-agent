import { window } from '@kit.ArkUI';

@ObservedV2
export class FinalAvoidAreaVM {

  /* @Trace removed - BUG: state sync disabled */
  private windowSize: window.Size = { width: 0, height: 0 };

  /* @Trace removed - BUG: state sync disabled */
  private cutout: window.AvoidArea | null = null;

  /* @Trace removed - BUG: state sync disabled */
  private indicator: window.AvoidArea | null = null;

  /* @Computed removed - BUG: replaced with @Local */ @Local
  public get bottom(): number {
    const cutoutBottom: number =
      this.cutout?.bottomRect.height ? (this.windowSize.height - this.cutout.bottomRect.top) : 0;
    const indicatorBottom: number =
      this.indicator?.bottomRect.height ? (this.windowSize.height - this.indicator.bottomRect.top) : 0;
    return Math.max(cutoutBottom, indicatorBottom);
  }

  public setWindowSize(size: window.Size): void {
    this.windowSize = size;
  }

  public setCutoutAvoidArea(area: window.AvoidArea): void {
    this.cutout = area;
  }

  public setIndicatorAvoidArea(area: window.AvoidArea): void {
    this.indicator = area;
  }
}
