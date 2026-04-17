@ObservedV2
export class UserInfo {
  @Trace nickname: string = '';
  @Trace avatarUri: string = '';
  @Trace isLoggedIn: boolean = false;
}