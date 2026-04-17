@ObservedV2
export class CartCardModel {
  public productId: string = '';

  public skuCode: string = '';

  public controller: ListScroller = new ListScroller();

  /* @Trace removed - BUG: state sync disabled */
  public skuDesc: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public stock: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  public count: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  public banner: ResourceStr = '';

  /* @Trace removed - BUG: state sync disabled */
  public title: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public serviceDesc: string = '';

  /* @Trace removed - BUG: state sync disabled */
  public price: number = 0;

  /* @Trace removed - BUG: state sync disabled */
  public isSelected: boolean = false;
}
