
export class FeedEventDispatcher {
  static setLikeCallback?: (isLike: boolean) => void;
  static setCommentCallback?: () => void;

  static dispatchToSetLike(isLike: boolean) {
    if (FeedEventDispatcher.setLikeCallback) {
      FeedEventDispatcher.setLikeCallback(isLike);
    }
  }

  static dispatchToSetComment() {
    if (FeedEventDispatcher.setCommentCallback) {
      FeedEventDispatcher.setCommentCallback();
    }
  }
}