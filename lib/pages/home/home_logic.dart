import 'package:family_finance/pages/home/reports/reports_page.dart';
import 'package:get/get.dart';
import '../../db/db_service.dart';
import '../../entity/expend_bean.dart';
import '../../entity/speech_bean.dart';
import 'create/create_page.dart';

class TTHomeLogic extends GetxController {
  static TTHomeLogic get to => Get.find<TTHomeLogic>();
  final db = Get.find<DatabaseService>();

  RxList<ExpendBean> familyPayList = [
    ExpendBean("assets/images/ic_pay_1.png", "Shopping", 0, 0.0),
    ExpendBean("assets/images/ic_pay_2.png", "Vehicle", 0, 0.0),
    ExpendBean("assets/images/ic_pay_3.png", "Furniture", 0, 0.0),
    ExpendBean("assets/images/ic_pay_4.png", "Electronics", 0, 0.0),
    ExpendBean("assets/images/ic_pay_5.png", "Repairs", 0, 0.0),
    ExpendBean("assets/images/ic_pay_6.png", "Entertainment", 0, 0.0),
    ExpendBean("assets/images/ic_pay_7.png", "Other", 0, 0.0),
  ].obs;

  RxList<ExpendBean> personPayList = [
    ExpendBean("assets/images/ic_pay_6.png", "Entertainment", 0, 0.0),
    ExpendBean("assets/images/ic_pay_1.png", "Shopping", 0, 0.0),
    ExpendBean("assets/images/ic_pay_8.png", "Schmoozing", 0, 0.0),
    ExpendBean("assets/images/ic_pay_9.png", "Healthcare", 0, 0.0),
    ExpendBean("assets/images/ic_pay_7.png", "Other", 0, 0.0),
  ].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    refreshFamilyList(refresh: false);
    refreshPersonalList(refresh: false);
  }

  refreshFamilyList({bool refresh = true}) async {
    for (var v in familyPayList) {
      int count = await db.getFamilyExpenseCountByType(v.type);
      double amount = await db.getFamilyTotalAmountByType(v.type);
      v.money = amount;
      v.count = count;
    }
    if (refresh) {
      familyPayList.refresh();
    }
  }

  refreshPersonalList({bool refresh = true}) async {
    for (var v in personPayList) {
      int count = await db.getPersonalExpenseCountByType(v.type);
      double amount = await db.getPersonalTotalAmountByType(v.type);
      v.money = amount;
      v.count = count;
    }
    if (refresh) {
      personPayList.refresh();
    }

  }

  clean() {
    familyPayList.value = [
      ExpendBean("assets/images/ic_pay_1.png", "Shopping", 0, 0.0),
      ExpendBean("assets/images/ic_pay_2.png", "Vehicle", 0, 0.0),
      ExpendBean("assets/images/ic_pay_3.png", "Furniture", 0, 0.0),
      ExpendBean("assets/images/ic_pay_4.png", "Electronics", 0, 0.0),
      ExpendBean("assets/images/ic_pay_5.png", "Repairs", 0, 0.0),
      ExpendBean("assets/images/ic_pay_6.png", "Entertainment", 0, 0.0),
      ExpendBean("assets/images/ic_pay_7.png", "Other", 0, 0.0),
    ];
    personPayList.value = [
      ExpendBean("assets/images/ic_pay_6.png", "Entertainment", 0, 0.0),
      ExpendBean("assets/images/ic_pay_1.png", "Shopping", 0, 0.0),
      ExpendBean("assets/images/ic_pay_8.png", "Schmoozing", 0, 0.0),
      ExpendBean("assets/images/ic_pay_9.png", "Healthcare", 0, 0.0),
      ExpendBean("assets/images/ic_pay_7.png", "Other", 0, 0.0),
    ];
  }

  toDetails(SpeechBean bean) {
    Get.toNamed('/dddd', arguments: {"bean": bean});
  }

  toADDByType(int type) {
    Get.to(CreatePage(
      index: type,
    ));
  }

  toReports() {
    Get.to(const ReportsPagePage());
  }
}
