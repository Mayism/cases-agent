export interface RecipeIngredient {
  name: string;
  quantity: string;
  unit: string;
}

export interface RecipeStep {
  stepNumber: number;
  description: string;
}

export interface RecipeDetail extends RecipeBriefInfo {
  ingredients: Array<RecipeIngredient>;
  steps: Array<RecipeStep>;
  isCollected?: boolean;
}

export interface RecipeBriefInfo {
  id: number;
  title: string;
  description: string;
  category: string;
  cookingTime: number;
  difficulty: string;
  authorId: number;
  author: string;
  authorAvatar: string;
  thumbnail: string;
  views: number;
  likes: number;
}

export interface QueryListParams {
  name?: string;
  category?: string;
}

export interface CollectionBody {
  id: number;
}

export interface RecipeCategory {
  id: number;
  name: string;
  recipeList: Array<RecipeBriefInfo>;
}

export interface UploadRecipeBody {
  title: string;
  description: string;
  ingredients: Array<RecipeIngredient>;
  steps: Array<RecipeStep>;
}

export interface DeleteMyRecipeBody {
  ids: number[];
}

export interface BloggerInfo {
  id: number
  name: string
  avatar: string
  profile: string
  sex: string
  createdAccount: string
  ipLocation: string
  bloggerType: string
  followers: number
  fans: number
  beFavorite: number
  beFollowed: number
  myRecipeList: RecipeDetail[]
  collectRecipeList: RecipeDetail[]
}

export interface BloggerFollower {
  id: number
  authorId: number;
  author: string;
  authorAvatar: string;
  isFollower:boolean
}