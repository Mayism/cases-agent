import { AccountUtil, RouterModule, UserInfoModel, LocationUtil, GeoAddressInfo } from 'commonlib';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = 'HomePageVM';

@ObservedV2
export class HomePageVM {
  private static _instance: HomePageVM;

  @Trace navStack: NavPathStack = RouterModule.getStack();

  @Trace curIndex: number = 0;

  @Trace userInfo: UserInfoModel = AccountUtil.getUserInfo();
  @Trace changeFontSize: number = 0;
  @Trace comment: string = '';

  // 位置相关状态
  @Trace isLocating: boolean = false;
  @Trace currentCity: string = '定位中...';
  @Trace locationAddress: GeoAddressInfo | null = null;

  public static get instance(): HomePageVM {
    if (!HomePageVM._instance) {
      HomePageVM._instance = new HomePageVM();
    }
    return HomePageVM._instance;
  }

  // 初始化
  public async init(): Promise<void> {
  }

  // 自动定位当前位置
  public async autoLocate(): Promise<void> {
    if (this.isLocating) {
      return;
    }

    this.isLocating = true;
    this.currentCity = '定位中...';

    try {
      // 获取位置信息
      const location = await LocationUtil.getCurrentLocation();
      if (!location) {
        this.currentCity = '定位失败';
        this.isLocating = false;
        return;
      }

      // 使用模拟地理编码获取地址（原子化服务不支持逆地理编码）
      const geoAddress: GeoAddressInfo = LocationUtil.getMockGeoAddress(location);
      if (geoAddress) {
        this.locationAddress = geoAddress;
        this.currentCity = geoAddress.city || geoAddress.province || '未知位置';
      } else {
        this.currentCity = '获取地址失败';
      }
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      this.currentCity = '定位失败';
    } finally {
      this.isLocating = false;
    }
  }

  // 手动刷新位置
  public async refreshLocation(): Promise<void> {
    await this.autoLocate();
  }
}