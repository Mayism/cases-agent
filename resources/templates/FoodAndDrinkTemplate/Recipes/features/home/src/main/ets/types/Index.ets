import { BloggerFollower } from 'network';

export interface TabItem {
  label: string,
  icon: ResourceStr
}

@ObservedV2
export class BloggerFollowerClz implements BloggerFollower {
  @Trace id: number = 0
  @Trace authorId: number = 0
  @Trace author: string = ''
  @Trace authorAvatar: string = ''
  @Trace isFollower: boolean = false

  constructor(id: number, authorId: number, author: string, authorAvatar: string, isFollower: boolean) {
    this.id = id;
    this.authorId = authorId;
    this.author = author;
    this.authorAvatar = authorAvatar;
    this.isFollower = isFollower;
  }

  update(data: BloggerFollower) {
    this.id = data.id;
    this.authorId = data.authorId;
    this.author = data.author;
    this.authorAvatar = data.authorAvatar;
    this.isFollower = data.isFollower;
  }
}