import { FullLoading } from './FullLoading';
import { Logger } from './Logger';

export function alertToConfirm(message: string, confirm: () => Promise<void>) {
  AlertDialog.show({
    message: message,
    alignment: DialogAlignment.Center,
    height: 125,
    primaryButton: {
      value: '取消',
      fontColor: '#1a1a1a',
      action: () => {
        Logger.info('取消');
      },
    },
    secondaryButton: {
      value: '确定',
      fontColor: $r('app.color.brand_red'),
      action: async () => {
        FullLoading.show();
        await confirm();
        FullLoading.hide();
      },
    },
  });
}