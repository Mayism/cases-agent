export interface TabInfo {
  id: string;
  text: ResourceStr;
  selected: boolean;
  order: number;
  disabled?: boolean
  visibility?: Visibility;
}

export enum GridObjectSortComponentType {
  IMAGE_TEXT = 'image_text',
  TEXT = 'text'
}

export interface PositionXY {
  x: number;
  y: number;
}
