@ObservedV2
export class CartCardModel {
  public productId: string = '';

  public skuCode: string = '';

  public controller: ListScroller = new ListScroller();
  public skuDesc: string = '';
  public stock: number = 0;
  public count: number = 0;
  public banner: ResourceStr = '';
  public title: string = '';
  public serviceDesc: string = '';
  public price: number = 0;
  public isSelected: boolean = false;
}
