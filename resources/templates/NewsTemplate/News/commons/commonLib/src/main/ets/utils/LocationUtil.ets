import { geoLocationManager } from '@kit.LocationKit';
import { abilityAccessCtrl, bundleManager, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

const TAG: string = '[LocationUtil]';

// 位置信息模型
export interface LocationInfo {
  latitude: number;
  longitude: number;
  altitude: number;
  accuracy: number;
  speed: number;
  direction: number;
  timestamp: number;
}

// 逆地理编码结果模型（原子化服务不支持逆地理编码，使用模拟数据）
export interface GeoAddressInfo {
  country: string;
  province: string;
  city: string;
  district: string;
  street: string;
  streetNumber: string;
  address: string;
}

// 模拟的城市数据（根据经纬度简单判断）
const MOCK_CITY_DATA: Record<string, GeoAddressInfo> = {
  '39.9-116.4': { country: '中国', province: '北京市', city: '北京', district: '', street: '', streetNumber: '', address: '北京市' },
  '31.2-121.5': { country: '中国', province: '上海市', city: '上海', district: '', street: '', streetNumber: '', address: '上海市' },
  '22.5-114.1': { country: '中国', province: '广东省', city: '深圳', district: '', street: '', streetNumber: '', address: '广东省深圳市' },
  '23.1-113.3': { country: '中国', province: '广东省', city: '广州', district: '', street: '', streetNumber: '', address: '广东省广州市' },
  '30.5-114.3': { country: '中国', province: '湖北省', city: '武汉', district: '', street: '', streetNumber: '', address: '湖北省武汉市' },
  '29.5-106.5': { country: '中国', province: '重庆市', city: '重庆', district: '', street: '', streetNumber: '', address: '重庆市' },
  '30.2-120.2': { country: '中国', province: '浙江省', city: '杭州', district: '', street: '', streetNumber: '', address: '浙江省杭州市' },
};

export class LocationUtil {
  private static _atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  private static _context: common.UIAbilityContext | null = null;

  // 位置权限列表
  private static readonly LOCATION_PERMISSIONS: Permissions[] = [
    'ohos.permission.APPROXIMATELY_LOCATION',
    'ohos.permission.LOCATION'
  ];

  /**
   * 设置上下文
   */
  public static setContext(context: common.UIAbilityContext): void {
    LocationUtil._context = context;
  }

  /**
   * 检查是否拥有位置权限
   */
  public static async checkLocationPermission(): Promise<boolean> {
    try {
      const bundleInfo: bundleManager.BundleInfo =
        bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      const tokenId: number = bundleInfo.appInfo.accessTokenId;

      for (const permission of LocationUtil.LOCATION_PERMISSIONS) {
        const grantStatus: abilityAccessCtrl.GrantStatus =
          await LocationUtil._atManager.checkAccessToken(tokenId, permission);
        if (grantStatus !== abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
          return false;
        }
      }
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(TAG, `Failed to check permission. Code: ${err.code}, Message: ${err.message}`);
      return false;
    }
  }

  /**
   * 请求位置权限
   */
  public static async requestLocationPermission(): Promise<boolean> {
    if (!LocationUtil._context) {
      Logger.error(TAG, 'Context is not set');
      return false;
    }

    try {
      const result = await LocationUtil._atManager.requestPermissionsFromUser(
        LocationUtil._context,
        LocationUtil.LOCATION_PERMISSIONS
      );

      const authResults: number[] = result.authResults;
      for (let i = 0; i < authResults.length; i++) {
        if (authResults[i] !== 0) {
          Logger.error(TAG, `Permission denied: ${LocationUtil.LOCATION_PERMISSIONS[i]}`);
          return false;
        }
      }
      Logger.info(TAG, 'All location permissions granted');
      return true;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(TAG, `Failed to request permission. Code: ${err.code}, Message: ${err.message}`);
      return false;
    }
  }

  /**
   * 获取当前位置
   */
  public static async getCurrentLocation(): Promise<LocationInfo | null> {
    const hasPermission = await LocationUtil.checkLocationPermission();
    if (!hasPermission) {
      const granted = await LocationUtil.requestLocationPermission();
      if (!granted) {
        Logger.error(TAG, 'Location permission not granted');
        return null;
      }
    }

    try {
      // 单次定位请求配置（原子化服务要求指定定位优先级）
      const requestInfo: geoLocationManager.SingleLocationRequest = {
        locatingTimeoutMs: 10000, // 定位超时时间，单位毫秒
        locatingPriority: geoLocationManager.LocatingPriority.PRIORITY_ACCURACY // 高精度定位优先
      };

      const location = await geoLocationManager.getCurrentLocation(requestInfo);

      const locationInfo: LocationInfo = {
        latitude: location.latitude,
        longitude: location.longitude,
        altitude: location.altitude ?? 0,
        accuracy: location.accuracy ?? 0,
        speed: location.speed ?? 0,
        direction: location.direction ?? 0,
        timestamp: location.timeStamp ?? Date.now()
      };

      Logger.info(TAG, `Location obtained: lat=${locationInfo.latitude}, lng=${locationInfo.longitude}`);
      return locationInfo;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(TAG, `Failed to get location. Code: ${err.code}, Message: ${err.message}`);
      return null;
    }
  }

  /**
   * 根据坐标获取城市信息（原子化服务不支持逆地理编码，使用模拟数据）
   */
  public static getMockGeoAddress(location: LocationInfo): GeoAddressInfo {
    // 根据经纬度范围匹配模拟城市
    const lat: number = Math.round(location.latitude * 10) / 10;
    const lng: number = Math.round(location.longitude * 10) / 10;
    const key: string = `${lat}-${lng}`;

    if (MOCK_CITY_DATA[key] !== undefined) {
      return MOCK_CITY_DATA[key];
    }

    // 根经纬度范围判断大致区域
    if (location.latitude >= 39 && location.latitude <= 41 && location.longitude >= 115 && location.longitude <= 118) {
      return { country: '中国', province: '北京市', city: '北京', district: '', street: '', streetNumber: '', address: '北京市' };
    }
    if (location.latitude >= 30 && location.latitude <= 32 && location.longitude >= 120 && location.longitude <= 122) {
      return { country: '中国', province: '上海市', city: '上海', district: '', street: '', streetNumber: '', address: '上海市' };
    }
    if (location.latitude >= 22 && location.latitude <= 24 && location.longitude >= 113 && location.longitude <= 115) {
      return { country: '中国', province: '广东省', city: '深圳', district: '', street: '', streetNumber: '', address: '广东省深圳市' };
    }
    if (location.latitude >= 29 && location.latitude <= 31 && location.longitude >= 113 && location.longitude <= 115) {
      return { country: '中国', province: '湖北省', city: '武汉', district: '', street: '', streetNumber: '', address: '湖北省武汉市' };
    }

    // 默认返回坐标信息
    return {
      country: '中国',
      province: '',
      city: `${location.latitude.toFixed(2)}°N`,
      district: '',
      street: '',
      streetNumber: '',
      address: `${location.latitude.toFixed(4)}, ${location.longitude.toFixed(4)}`
    };
  }

  /**
   * 获取当前城市名称（简化版）
   */
  public static async getCurrentCity(): Promise<string> {
    const location = await LocationUtil.getCurrentLocation();
    if (!location) {
      return '定位失败';
    }

    const geoAddress = LocationUtil.getMockGeoAddress(location);
    return geoAddress.city || geoAddress.province || `${location.latitude.toFixed(2)}°N`;
  }

  /**
   * 判断定位服务是否开启
   */
  public static isLocationEnabled(): boolean {
    try {
      return geoLocationManager.isLocationEnabled();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      Logger.error(TAG, `Failed to check location service. Code: ${err.code}, Message: ${err.message}`);
      return false;
    }
  }
}