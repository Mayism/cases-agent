export interface TabListItem {
  label: string;
  icon: Resource;
  iconChecked: Resource;
  component: WrappedBuilder<[]>;
}

export interface SettingItem {
  icon: ResourceStr;
  label: string;
  url: string;
  group: number;
}

@ObservedV2
export class FormModel {
  @Trace orderId: number = 0;
  @Trace url: string = '';
}