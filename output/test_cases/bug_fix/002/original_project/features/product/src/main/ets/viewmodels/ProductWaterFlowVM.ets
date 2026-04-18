import { util } from '@kit.ArkTS';
import { motion } from '@kit.MultimodalAwarenessKit';
import { BreakpointSystem, BreakpointTypeEnum, MotionUtil, RouterMap, routerStack, WindowUtil } from 'lib_foundation';
import { FilterSelectionItem, ProductApis, ProductCardItem } from 'lib_network';
import { LoneTakeAnimationsTransition, LongTakeTransitionParam } from 'module_transition';
import { SortTypeMap } from '../commons/Enums';
import { WaterFlowScaleUtil } from '../utils/WaterFlowScaleUtil';

@ObservedV2
export class ProductWaterFlowVM {
  categoryId: string = '';
  keyword: string = '';
  slotId: string = '';
  sortType: SortTypeMap = SortTypeMap.DEFAULT;
  filterList: FilterSelectionItem[] = [];
  dataList: ProductCardItem[] = [];
  reachEnd: boolean = false;
  isLoading: boolean = false;
  isGrid: boolean = false;
  scrollHeight: number = 0;
  startBack: boolean = false;
  curPage: number = 1;
  showSheet: boolean = false;
  testId: string = util.generateRandomUUID(false);
  scroller: Scroller = new Scroller();
  private _uiContext: UIContext = WindowUtil.globalUIContext;

  @Local
  get edgeEffect() {
    if (typeof this.scroller.isAtEnd() === 'undefined') {
      return EdgeEffect.Spring;
    }
    return this.reachEnd || this.scroller.isAtEnd() ? EdgeEffect.Spring : EdgeEffect.None;
  }

  @Local
  get showButton() {
    return this.scrollHeight > 400;
  }

  @Local
  get backButtonPosition(): Edges {
    if (canIUse('SystemCapability.MultimodalAwareness.Motion') &&
      MotionUtil.holdingHand === motion.HoldingHandStatus.LEFT_HAND_HELD) {
      return {
        left: 16,
        bottom: 56,
      };
    }
    return {
      right: 16,
      bottom: 56,
    };
  }

  @Local
  get columnTemplate() {
    if (this.isGrid) {
      return BreakpointSystem.currentBreakpoint.value === BreakpointTypeEnum.LG ? '1fr 1fr' : '1fr';
    }
    const newTemplate = WaterFlowScaleUtil.columnsTemplate;
    return newTemplate;
  }

  async refreshList() {
    this.curPage = 1;
    this.reachEnd = false;
    this.dataList = [];
    await this.getDataList();
  }

  async getDataList() {
    if (this.reachEnd) {
      return;
    }
    this.isLoading = true;
    const res = await ProductApis.getProductList({
      curPage: this.curPage,
      categoryId: this.categoryId,
      keyword: this.keyword,
      sortType: this.sortType,
      filterList: this.filterList,
      slotId: this.slotId,
    });
    if (res.code === 0) {
      this.reachEnd = res.isFinal;
      this.dataList.push(...res.list);
      if (this.columnTemplate.split(' ').length >= 4 &&
      this.dataList.length &&
        this.dataList.length < 10 &&
        !this.reachEnd) {
        this.dataList.push(...res.list);
      }
      this.curPage++;
    }
    this.isLoading = false;
  }

  async jumpToSwiperPage(snapShotComponentId: string) {
    let longTakeTransitionParam: LongTakeTransitionParam | undefined =
      LoneTakeAnimationsTransition.generateLongTakeParam(this._uiContext, snapShotComponentId, 9);
    const res = await ProductApis.getProductList({
      curPage: 1,
      targetId: snapShotComponentId.split('/')[1],
    });
    const param: Record<string, Object | undefined> = {
      'snapShotId': snapShotComponentId,
      'longTakeTransitionParam': longTakeTransitionParam,
      'dataList': res.list ?? [],
    };
    routerStack.pushPath({
      name: RouterMap.PRODUCT_SWIPER,
      param: param,
    });
  }

  async handleBackToTop() {
    this.startBack = true;
    this.scroller.scrollTo({
      xOffset: 0,
      yOffset: 0,
      animation: {
        curve: Curve.Linear,
        duration: 500,
      },
    });
  }
}