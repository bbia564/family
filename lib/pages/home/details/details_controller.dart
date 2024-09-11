import 'package:get/get.dart';

import '../../../db/db_service.dart';
import '../../../entity/expend_bean.dart';
import '../../../entity/pay_item.dart';

class DetailsController extends GetxController {
  final db = Get.find<DatabaseService>();
  late ExpendBean bean;

  int type = 0;

  RxList<PayItem> list = <PayItem>[].obs;

  @override
  void onInit() {

    init();
    super.onInit();
  }

  init() async {
    bean = Get.arguments["bean"];
    type = Get.arguments["type"];
    if (type == 0) {
      list.value = await db.getFamilyPay(bean.type);
    } else {
      list.value = await db.getPersonalPay(bean.type);
    }
  }
}
