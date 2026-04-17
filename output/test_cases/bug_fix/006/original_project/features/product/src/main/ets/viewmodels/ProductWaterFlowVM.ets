import { util } from '@kit.ArkTS';
import { motion } from '@kit.MultimodalAwarenessKit';
import { BreakpointSystem, BreakpointTypeEnum, MotionUtil, RouterMap, routerStack, WindowUtil } from 'lib_foundation';
import { FilterSelectionItem, ProductApis, ProductCardItem } from 'lib_network';
import { LoneTakeAnimationsTransition, LongTakeTransitionParam } from 'module_transition';
import { SortTypeMap } from '../commons/Enums';
import { WaterFlowScaleUtil } from '../utils/WaterFlowScaleUtil';

@ObservedV2
export class ProductWaterFlowVM {
  /* @Trace removed - BUG: state sync disabled */
  categoryId: string = '';
  /* @Trace removed - BUG: state sync disabled */
  keyword: string = '';
  /* @Trace removed - BUG: state sync disabled */
  slotId: string = '';
  /* @Trace removed - BUG: state sync disabled */
  sortType: SortTypeMap = SortTypeMap.DEFAULT;
  /* @Trace removed - BUG: state sync disabled */
  filterList: FilterSelectionItem[] = [];
  /* @Trace removed - BUG: state sync disabled */
  dataList: ProductCardItem[] = [];
  /* @Trace removed - BUG: state sync disabled */
  reachEnd: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  isLoading: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  isGrid: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  scrollHeight: number = 0;
  /* @Trace removed - BUG: state sync disabled */
  startBack: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  curPage: number = 1;
  /* @Trace removed - BUG: state sync disabled */
  showSheet: boolean = false;
  /* @Trace removed - BUG: state sync disabled */
  testId: string = util.generateRandomUUID(false);
  scroller: Scroller = new Scroller();
  private _uiContext: UIContext = WindowUtil.globalUIContext;

  /* @Computed removed - BUG: replaced with @Local */ @Local
  get edgeEffect() {
    if (typeof this.scroller.isAtEnd() === 'undefined') {
      return EdgeEffect.Spring;
    }
    return this.reachEnd || this.scroller.isAtEnd() ? EdgeEffect.Spring : EdgeEffect.None;
  }

  /* @Computed removed - BUG: replaced with @Local */ @Local
  get showButton() {
    return this.scrollHeight > 400;
  }

  /* @Computed removed - BUG: replaced with @Local */ @Local
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

  /* @Computed removed - BUG: replaced with @Local */ @Local
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