import { CommonBanner } from '../../components/common/CommonBanner';
import { QueueFilterListCom } from '../../components/queue/QueueFilterListCom';
import { QueueVM } from '../../viewmodels/QueueVM';
import { QueueStoreListCom } from '../../components/queue/QueueStoreListCom';
import { CommonPage } from '../../components/common/CommonPage';

@ComponentV2
export struct QueuePage {
  vm: QueueVM = QueueVM.instance;

  async aboutToAppear() {
    this.vm.resetQueueParams();
    await this.vm.getQueueStoreList();
  }

  build() {
    CommonPage({
      title: '排号',
      mainUi: () => {
        this.queueMainUiBuilder();
      },
    })
  }

  @Builder
  queueMainUiBuilder() {
    /** banner **/
    CommonBanner()

    /** 搜索框 **/
    Search({ value: $$this.vm.query, placeholder: '搜索门店' }).margin(0)

    /** 筛选栏 **/
    QueueFilterListCom()

    /** 门店列表 **/
    QueueStoreListCom().constraintSize({ minHeight: '48%' }).layoutWeight(1)
  }
}

@Builder
export function queuePageBuilder() {
  QueuePage()
}