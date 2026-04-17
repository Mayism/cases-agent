import { curves } from '@kit.ArkUI';

export class ChannelConstants {
  static readonly COL_IMAGE_TEXT = 3;
  static readonly COL_TEXT = 4;
  static readonly GRID_COL_3 = '1fr 1fr 1fr';
  static readonly GRID_COL_4 = '1fr 1fr 1fr 1fr';
  static readonly ICON_SIZE = 24;
  static readonly SYMBOL_SIZE_24VP = '24vp';
  static readonly SYMBOL_SIZE_12FP = 12;
  static readonly SYMBOL_DEFAULT = '56vp';
  static readonly SYMBOL_WEIGHT = 400;
  static readonly TEXT_PADDING_LEFT_RIGHT = 12;
  static readonly PADDING_EIGHT = 4;
  static readonly GRID_ITEM_HEIGHT_TEXT = 28;
  static readonly MARGIN_EIGHT = 8;
  static readonly ROW_GAP = 16;
  static readonly SUBTITLE_HEIGHT = 56;
  static readonly TEXT_MAX_LINES = 1;
  static readonly MIN_FONT_SCALE = 1;
  static readonly MAX_FONT_SCALE = 2;
  static readonly MIN_SYMBOL_FONT_SCALE = 1.15;
  static readonly DEFAULT_TEXT_SIZE = 12;
  static readonly DEFAULT_FONT_SIZE_SCALE = 1;
  static readonly DEFAULT_FONT_WEIGHT_SCALE = 1;
  static readonly DEFAULT_BLOCK_TEXT_ITEM_SAFE_MARGIN = 8;
  static readonly EDIT_BLOCK_TEXT_ITEM_SAFE_MARGIN = 16;
  static readonly ENTER_EXIT_ICON_DURATION = 200;
  static readonly COMMON_BEZIER = curves.cubicBezierCurve(0.33, 0, 0.67, 1);
  static readonly DRAG_SPRING = curves.interpolatingSpring(0, 1, 400, 38);
  static readonly REMOVE_ADD_SPRING = curves.interpolatingSpring(0, 1, 150, 24);
  static readonly LONG_TOUCH_SCALE = curves.cubicBezierCurve(0.2, 0, 0.2, 1);
  static readonly EDIT_TITLE_BAR_ID: string = 'EditTitleBar';
  static readonly ADD: string = 'add';
  static readonly EDIT: string = 'edit';
}
