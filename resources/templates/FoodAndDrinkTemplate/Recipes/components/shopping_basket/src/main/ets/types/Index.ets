import { Type } from '@kit.ArkUI';

@ObservedV2
export class IngredientItem {
  @Trace name: string = '';
  @Trace quantity: string = '';
  @Trace unit: string = '';
  @Trace sum: string = '0';
  @Trace sumArr: string[] = [];

  constructor(name: string = '', quantity: string = '', unit: string = '') {
    this.name = name;
    this.quantity = quantity;
    this.unit = unit;
  }
}

@ObservedV2
export class BasketItem {
  id: number = 0;
  title: string = '';
  @Type(IngredientItem)
  @Trace todoList: IngredientItem[] = [];
  @Type(IngredientItem)
  @Trace finishedList: IngredientItem[] = [];

  constructor(id: number = 0, title: string = '', todoList: IngredientItem[] = [],
    finishedList: IngredientItem[] = []) {
    this.id = id;
    this.title = title;
    this.todoList = todoList;
    this.finishedList = finishedList;
  }
}

export interface RecipeIngredient {
  name: string;
  quantity: string;
  unit: string;
}
