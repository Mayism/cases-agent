import { CommonConstants } from './Common';
import { ColumnModifier, ListItemModifier, ListModifier, RowModifier } from '@kit.ArkUI';

class ContainerModifier implements AttributeModifier<RowModifier | ColumnModifier | ListModifier | ListItemModifier> {
  public applyNormalAttribute(instance: CommonAttribute): void {
    instance
      .width(CommonConstants.FULL_WIDTH)
      .padding($r('app.string.padding_12'))
      .borderRadius($r('app.string.border_radius_16'))
      .backgroundColor($r('app.color.system_color_background_white'))
  }
}

export const CONTAINER_STYLE: ContainerModifier = new ContainerModifier();