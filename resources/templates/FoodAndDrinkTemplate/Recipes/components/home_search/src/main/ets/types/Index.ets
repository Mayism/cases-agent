// 排序规则
export enum SortType {
  General = '0',
  Grade = '1',
  Cooked = '2'
}

export interface TabItem {
  label: string,
  sortType: SortType
}

export interface RecipeBriefInfo {
  id: number;
  title: string;
  description: string;
  category: string;
  cookingTime: number;
  difficulty: string;
  author: string;
  authorAvatar: string;
  thumbnail: string;
  views: number;
  likes: number;
}

