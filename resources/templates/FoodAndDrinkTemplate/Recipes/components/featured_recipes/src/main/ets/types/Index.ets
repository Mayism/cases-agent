@ObservedV2
export class RecipeBriefInfo {
  @Trace id: number = 0
  @Trace title: string = ''
  @Trace description: string = ''
  @Trace category: string = ''
  @Trace cookingTime: number = 0
  @Trace difficulty: string = ''
  @Trace authorId: number = 0
  @Trace author: string = ''
  @Trace authorAvatar: string = ''
  @Trace thumbnail: string = ''
  @Trace views: number = 0;
  @Trace likes: number = 0;
}

export interface TabItem {
  label: string,
  icon: ResourceStr
}