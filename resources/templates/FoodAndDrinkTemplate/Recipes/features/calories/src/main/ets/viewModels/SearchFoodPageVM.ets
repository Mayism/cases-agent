import { RouterMap, RouterModule } from 'commonlib';
import { addDietPlans, FoodPlanCaloriesBody, searchFoodByName } from 'network';
import { FoodCalories } from '../types/Index';
import { promptAction } from '@kit.ArkUI';

@ObservedV2
export class SearchFoodPageVM {
  @Trace searchResul: FoodCalories[] = []
  @Trace searchText: string = ''
  @Trace showAddFoodSheet: boolean = false
  @Trace selectIndex: number = 0
  @Trace selectText: ResourceStr = '早餐'
  @Trace inputText: string = ''
  menuList: Array<SelectOption> = [
    { value: '早餐', icon: $r('app.media.ic_checked') },
    { value: '午餐', icon: $r('app.media.ic_checked') },
    { value: '晚餐', icon: $r('app.media.ic_checked') },
    { value: '上午加餐', icon: $r('app.media.ic_checked') },
    { value: '中午加餐', icon: $r('app.media.ic_checked') },
    { value: '晚上加餐', icon: $r('app.media.ic_checked') }]
  keyboardList: Array<string> = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', '.']

  init() {
    let params = RouterModule.getNavParam<Record<string, number>>(RouterMap.SEARCH_FOOD_PAGE)
    this.selectIndex = params?.id || 0
    this.selectText = this.menuList[this.selectIndex].value
  }

  searchFood() {
    if (!this.searchText) {
      return
    }
    searchFoodByName(this.searchText).then(res => {
      this.searchResul = this.searchResul.filter(() => false)
      if (res.status === 200) {
        this.searchResul = res.data

      }
    })
  }

  btnClick(item: string) {
    if (item === '.' && this.inputText.includes('.')) {
      return
    }
    if (this.inputText.includes('.') && this.inputText.substring(this.inputText.indexOf('.') + 1).length >= 2) {
      return
    }
    if (item !== '.' && !this.inputText.includes('.') && Number(this.inputText) === Number(this.inputText + item)) {
      return
    }
    if (Number(this.inputText + item) > 9999) {
      return
    }
    this.inputText = this.inputText + item
  }

  deleteBtn() {
    if (this.inputText.length) {
      this.inputText = this.inputText.substring(0, this.inputText.length - 1)
    }
  }

  confirmBtn(item: FoodCalories) {
    let data: FoodPlanCaloriesBody[] = [{
      id: item.id,
      name: item.name,
      weight: Number(this.inputText) || 100,
      calories: item.calories,
    }]
    addDietPlans(this.selectIndex, this.selectText.toString(), data).then(res => {
      if (res.status === 200) {
        RouterModule.pop('success')
        this.showAddFoodSheet = false
      } else {
        promptAction.showToast({ message: '添加失败~' })
      }
    })
  }
}