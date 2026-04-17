import { Type } from '@kit.ArkUI';
import { RecipeDetail } from 'network';
import { BasketItem, IngredientItem } from 'shopping_basket';

@ObservedV2
export class BasketList {
  @Type(BasketItem)
  @Trace list: BasketItem[] = [];
  @Trace id: number = 0;

  constructor(list: BasketItem[] = []) {
    this.list = list;
  }

  public addBasket(data: RecipeDetail) {
    let ingredients: IngredientItem[] =
      data.ingredients.map(item => new IngredientItem(item.name, item.quantity, item.unit));
    let basketItem: BasketItem = new BasketItem(data.id, data.title, ingredients);
    this.list.push(basketItem);
  }

  public isInBasket(id: number): boolean {
    return this.list.some((item: BasketItem) => item.id === id);
  }
}

export interface RecipeIngredient {
  name: string;
  quantity: string;
  unit: string;
}
