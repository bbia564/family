import 'package:get/get.dart';

import '../../../db/db_service.dart';
import '../../../entity/expend_bean.dart';
import '../home_logic.dart';

class FamilyReportsLogic extends GetxController {
  final db = Get.find<DatabaseService>();
  var checkTag = "".obs;
  List<ExpendBean> familyReportsList = [];
  var totalEx = 0.0.obs;
  var totalTr = 0.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    familyReportsList = TTHomeLogic.to.familyPayList;
    totalEx.value = await db.getFamilyTotalAmount();
    totalTr.value = await db.getFamilyExpenseCount();
  }
}
