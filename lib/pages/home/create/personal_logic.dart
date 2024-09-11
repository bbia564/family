import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker2/flutter_cupertino_datetime_picker2.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../db/db_service.dart';
import '../../../entity/expend_bean.dart';
import '../../../res/colors.dart';
import '../home_logic.dart';

class PersonalExpensesLogic extends GetxController {
  final db = Get.find<DatabaseService>();
  var checkTag = "".obs;
  List<ExpendBean> tags = [
    ExpendBean("assets/images/ic_pay_6.png", "Entertainment", 0, 0.0),
    ExpendBean("assets/images/ic_pay_1.png", "Shopping", 0, 0.0),
    ExpendBean("assets/images/ic_pay_8.png", "Schmoozing", 0, 0.0),
    ExpendBean("assets/images/ic_pay_9.png", "Healthcare", 0, 0.0),
    ExpendBean("assets/images/ic_pay_7.png", "Other", 0, 0.0),
  ];
  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');
  TextEditingController dataTC = TextEditingController();
  TextEditingController amountTC = TextEditingController();
  TextEditingController notesTC = TextEditingController();
  DateTime? dateTime;

  selectDate() {
    DatePicker.showDatePicker(Get.context!,
        pickerMode: DateTimePickerMode.date,
        pickerTheme: const DateTimePickerTheme(
            cancelTextStyle: TextStyle(color: Color(0xFF939393), fontSize: 16),
            confirmTextStyle: TextStyle(color: AppColors.themeText, fontSize: 16)),
        dateFormat: 'MM/dd/yyyy', onConfirm: (date, dateList) {
      dataTC.text = formatterDay.format(date);
      dateTime = date;
    });
  }

  submit() async {
    if (checkTag.value.isEmpty || dataTC.text.isEmpty || amountTC.text.isEmpty) {
      return;
    }
    EasyLoading.show();
    String date = dateTime!.toIso8601String().split('T')[0];
    await db.addPersonalExpenses(checkTag.value, double.parse(amountTC.text), date, notesTC.text);
    TTHomeLogic.to.refreshPersonalList();
    Future.delayed(const Duration(seconds: 1)).then((v) {
      EasyLoading.dismiss();
      Get.back();
    });
  }
}
