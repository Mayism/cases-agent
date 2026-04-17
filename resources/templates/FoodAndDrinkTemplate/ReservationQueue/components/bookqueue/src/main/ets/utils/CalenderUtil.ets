import { abilityAccessCtrl, bundleManager, Context, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { calendarManager } from '@kit.CalendarKit';
import { Logger } from './Logger';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { BookOrderDetail } from '../network/types/ResponseTypes';
import { formatTimeStrToDate } from './Format';
import { OrderUtil } from './OrderUtil';

const TAG = '[CalenderUtil]';

export class CalenderUtil {
  private static _calendar: calendarManager.Calendar | undefined = undefined;

  public static async init(ctx: Context) {
    const hasPermission = await CalenderUtil._requestCalendarPermissions(ctx);
    if (!hasPermission) {
      Logger.error(TAG, 'Get Calender Permission error.');
      return;
    }
    CalenderUtil._calendar = await calendarManager.getCalendarManager(ctx).getCalendar();
  }

  public static addCalenderEvent(order: BookOrderDetail) {
    if (OrderUtil.checkHasSchedule(getContext(), order.orderId)) {
      promptAction.showToast({ message: '已添加至日程' });
      return;
    }
    const date: Date = formatTimeStrToDate(order.time);
    const event: calendarManager.Event = {
      title: `订座-${order.store.name}`,
      location: { location: order.store.location },
      type: calendarManager.EventType.NORMAL,
      startTime: date.getTime(),
      endTime: date.getTime() + 60 * 60 * 1000,
      reminderTime: [30],
    };

    CalenderUtil._calendar?.addEvent(event).then((data: number) => {
      Logger.info(TAG, `Succeeded in adding event, id -> ${data}`);
      promptAction.showToast({ message: '订座日程添加成功' });
      OrderUtil.updateSchedule(getContext(), order.orderId);
      Logger.info(TAG, data.toString());
    }).catch((err: BusinessError) => {
      promptAction.showToast({ message: '订座日程添加失败' });
      Logger.error(TAG, `Failed to addEvent. Code: ${err.code}, message: ${err.message}`);
    });
  }

  private static async _requestCalendarPermissions(context: Context): Promise<boolean> {
    try {
      const accessCtrlManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      const accessTokenId: number = await CalenderUtil._getAccessTokenId();
      const permissions: Permissions[] = ['ohos.permission.READ_CALENDAR', 'ohos.permission.WRITE_CALENDAR'];
      for (let permission of permissions) {
        if (
          accessCtrlManager.checkAccessTokenSync(accessTokenId, permission) ===
          abilityAccessCtrl.GrantStatus.PERMISSION_DENIED
        ) {
          const result: PermissionRequestResult =
            await accessCtrlManager.requestPermissionsFromUser(context, permissions);
          return result.authResults.every((auth) => auth === 0);
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }


  private static async _getAccessTokenId(): Promise<number> {
    let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION,
    );
    let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
    return appInfo.accessTokenId;
  }
}