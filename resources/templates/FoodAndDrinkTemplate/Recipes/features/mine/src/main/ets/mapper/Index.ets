import { RecipeBriefInfo as RecipeBriefInfoResp } from 'network';
import { RecipeBriefInfo } from 'featured_recipes';
import { RecipeItem } from '../types/Index';

export function historyListMapper(list: RecipeBriefInfo[]) {
  let recipeList: RecipeItem[] = [];
  list.forEach(item => {
    let recipeItem: RecipeItem = new RecipeItem();
    recipeItem.id = item.id;
    recipeItem.banner = item.thumbnail;
    recipeItem.used = item.views;
    recipeItem.star = item.likes;
    recipeItem.title = item.title;
    recipeItem.label = item.category.split('、');
    recipeItem.nickname = item.author;
    recipeItem.avatar = item.authorAvatar || 'ic_avatar';
    recipeList.push(recipeItem);
  });

  return recipeList;
}

export function recipeListMapper(list: RecipeBriefInfoResp[]) {
  let recipeList: RecipeBriefInfo[] = [];
  list.forEach(item => {
    let recipeItem: RecipeBriefInfo = new RecipeBriefInfo();
    recipeItem.id = item.id;
    recipeItem.title = item.title;
    recipeItem.description = item.description;
    recipeItem.category = item.category;
    recipeItem.cookingTime = item.cookingTime;
    recipeItem.difficulty = item.difficulty;
    recipeItem.author = item.author;
    recipeItem.authorId = item.authorId;
    recipeItem.authorAvatar = item.authorAvatar || 'ic_avatar';
    recipeItem.thumbnail = item.thumbnail;
    recipeItem.views = item.views;
    recipeItem.likes = item.likes;
    recipeList.push(recipeItem);
  });

  return recipeList;
}