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
  configInfo: CustomConfigModel = AppStorageV2.connect(
    CustomConfigModel,
    () => new CustomConfigModel(),
  )!;
  windowModel: CustomWindowModel = AppStorageV2.connect(
    CustomWindowModel,
    () => new CustomWindowModel(),
  )!;
  fontModel: FontModel = AppStorageV2.connect(
    FontModel,
    () => new FontModel(),
  )!;
  breakPointModel: BreakpointModel = AppStorageV2.connect(
    BreakpointModel,
    () => new BreakpointModel(),
  )!;
  scrollModifier: CustomScrollModifier = new CustomScrollModifier();
  pageModifier: CustomPageModifier = new CustomPageModifier();
}
