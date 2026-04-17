import { NewsEnum, VideoEnum } from '../constants/Constants'
import { NavInfo, PostImgList } from '../params/base/BaseModel'
import { AuthorResponse } from '../params/response/AuthorResponse'
import { CommentResponse } from '../params/response/CommentResponse'
import { NewsResponse } from '../params/response/NewsResponse'

@ObservedV2
export class NewsModel implements NewsResponse {
  @Trace id: string = ''
  @Trace type: NewsEnum
  @Trace title: string = ''
  @Trace author: AuthorResponse
  @Trace createTime: number
  @Trace comments: CommentResponse[]
  @Trace markCount: number
  @Trace likeCount: number
  @Trace shareCount: number
  @Trace isLiked: boolean
  @Trace isMarked: boolean
  @Trace postBody: string
  @Trace postImgList: PostImgList[]
  @Trace videoUrl: string
  @Trace coverUrl: string
  @Trace videoType?: VideoEnum
  @Trace videoDuration: number
  @Trace commentCount: number
  @Trace richContent: string
  @Trace recommends: NewsResponse[]
  @Trace navInfo?: NavInfo
  @Trace extraInfo?: Record<string, string | boolean | Record<string, string | boolean>[]>
  @Trace articleFrom?: string
  @Trace playCount?: string
  @Trace totalCount?: number
  @Trace relationId?: string

  constructor(v: NewsResponse) {
    this.id = v.id;
    this.type = v.type;
    this.title = v.title;
    this.author = v.author;
    this.createTime = v.createTime;
    this.comments = v.comments || [];
    this.markCount = v.markCount;
    this.likeCount = v.likeCount;
    this.shareCount = v.shareCount;
    this.isLiked = v.isLiked;
    this.isMarked = v.isMarked;
    this.postBody = v.postBody || '';
    this.postImgList = v.postImgList || [];
    this.videoUrl = v.videoUrl || '';
    this.coverUrl = v.coverUrl || '';
    this.videoDuration = v.videoDuration || 0;
    this.videoType = v.videoType
    this.commentCount = v.commentCount;
    this.richContent = v.richContent || ''
    this.recommends = v.recommends || []
    this.navInfo = v.navInfo
    this.extraInfo = v.extraInfo
    this.articleFrom = v.articleFrom
    this.playCount = v.playCount
    this.totalCount = v.totalCount
    this.relationId = v.relationId
  }
}