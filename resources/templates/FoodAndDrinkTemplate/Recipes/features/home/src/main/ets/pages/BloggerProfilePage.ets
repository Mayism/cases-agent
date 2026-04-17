import { buildTitleBar, RouterMap, RouterModule } from 'commonlib'
import { BloggerProfilePageVM } from '../viewModels/BloggerProfilePageVM'
import { LengthMetrics } from '@kit.ArkUI'
import { PersonalHomepage } from 'personal_homepage'

@Builder
export function BloggerProfilePageBuilder() {
  BloggerProfilePage()
}

@ComponentV2
struct BloggerProfilePage {
  @Local vm: BloggerProfilePageVM = new BloggerProfilePageVM()

  aboutToAppear(): void {
    this.vm.init()
  }

  build() {
    NavDestination() {
      Column() {
        PersonalHomepage({
          bloggerInfo: this.vm.bloggerInfo,
          recipeList: this.vm.recipeList,
          isFollower: this.vm.isFollower,
          currentIndex: this.vm.currentIndex,
          onClickCb: (id: number) => {
            RouterModule.push(RouterMap.DISHES, { 'id': id } as Record<string, number>)
          },
          jumpBloggerInfo: (id: number) => {
            RouterModule.push(RouterMap.BLOGGER_PROFILE_PAGE, { 'id': id } as Record<string, number>)
          },
          followCb: (isFollower: boolean) => {
            this.vm.followCb(isFollower)
          },
          changeTabIndex: (index: number) => {
            this.vm.changeTabs(index)
          },
          jumpFollowers: () => {
            RouterModule.push(RouterMap.FOLLOWERS_PAGE, { 'id': this.vm.bloggerInfo.id } as Record<string, number>)
          },
        })
      }
    }.title(buildTitleBar('', true), { paddingStart: LengthMetrics.vp(16) })
  }
}