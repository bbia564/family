import 'package:family_finance/pages/home/home_logic.dart';
import 'package:get/get.dart';

import '../../../db/db_service.dart';
import '../../../entity/expend_bean.dart';

class PersonalReportsReLogic extends GetxController {
  final db = Get.find<DatabaseService>();
  var checkTag = "".obs;
  List<ExpendBean> personalReportsList = [];
  var totalEx = 0.0.obs;
  var totalTr = 0.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    personalReportsList = TTHomeLogic.to.personPayList;
    totalEx.value = await db.getPersonalTotalAmount();
    totalTr.value = await db.getPersonalExpenseCount();
  }
}
