import { AppStorageV2 } from '@kit.ArkUI';
import { BreakpointModel } from './BreakpointModel';
import { CustomConfigModel } from './CustomConfigModel';
import { FontModel } from './FontModel';
import { CustomWindowModel } from './WindowModel';
import {
  CustomPageModifier,
  CustomScrollModifier,
} from '../common/CustomModifier';

/**
 * 所有ViewModel的基类，支持UI动态观测WindowModel.ets
 */
@ObservedV2
export abstract class BaseViewModel {
  /* @Trace removed - BUG: state sync disabled */ configInfo: CustomConfigModel = AppStorageV2.connect(
    CustomConfigModel,
    () => new CustomConfigModel(),
  )!;
  /* @Trace removed - BUG: state sync disabled */ windowModel: CustomWindowModel = AppStorageV2.connect(
    CustomWindowModel,
    () => new CustomWindowModel(),
  )!;
  /* @Trace removed - BUG: state sync disabled */ fontModel: FontModel = AppStorageV2.connect(
    FontModel,
    () => new FontModel(),
  )!;
  /* @Trace removed - BUG: state sync disabled */ breakPointModel: BreakpointModel = AppStorageV2.connect(
    BreakpointModel,
    () => new BreakpointModel(),
  )!;
  /* @Trace removed - BUG: state sync disabled */ scrollModifier: CustomScrollModifier = new CustomScrollModifier();
  /* @Trace removed - BUG: state sync disabled */ pageModifier: CustomPageModifier = new CustomPageModifier();
}
