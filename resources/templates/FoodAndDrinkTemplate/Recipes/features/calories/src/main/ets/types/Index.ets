import { MenuItemBuilder } from 'commonlib';

@ObservedV2
export class  FoodCalories {
  @Trace id: number = 0;
  @Trace name: string = '';
  @Trace category: string = '';
  @Trace weight?: number = 100;
  @Trace calories: number = 0;

  constructor(id: number = 0, name: string = '', category: string = '', weight: number = 100, calories: number = 0) {
    this.id = id;
    this.name = name;
    this.category = category;
    this.weight = weight;
    this.calories = calories;
  }
}
@ObservedV2
export class FoodCategory {
  @Trace id: number = 0;
  @Trace name: string= '';
  @Trace foodList: Array<FoodCalories> = [];

  constructor(id: number = 0, name: string= '', foodList: Array<FoodCalories> = []) {
    this.id = id;
    this.name = name;
    this.foodList = foodList;
  }
}

export class MyMenuItem implements ContentModifier<MenuItemConfiguration> {
  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(MenuItemBuilder)
  }
}
