import 'package:family_finance/pages/home/create/personal_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../res/style.dart';
import 'check_item.dart';

class PersonalExpensesTab extends StatelessWidget {
  const PersonalExpensesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalExpensesLogic>(
        init: PersonalExpensesLogic(),
        builder: (logic) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Obx(() => Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: logic.tags.map((tag) {
                          return InkWell(
                            onTap: () {
                              logic.checkTag.value = tag.type;
                            },
                            child: CheckItem(
                                isCheck: logic.checkTag.value == tag.type,
                                tag: tag.type,
                                tagImage: tag.image),
                          );
                        }).toList(),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 9, left: 24),
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xFF535353)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: AppStyle.outLineDecoration,
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      InkWell(
                        onTap: () {
                          logic.selectDate();
                        },
                        child: TextField(
                          enabled: false,
                          controller: logic.dataTC,
                          style: AppStyle.inputStyles,
                          decoration: InputDecoration(
                              hintText: "Select Date",
                              hintStyle: AppStyle.hintStyles,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                        ),
                      ),
                      const Positioned(
                        right: 16,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xFFA8A8A8),
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 9, left: 24),
                  child: Text(
                    "Amount",
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xFF535353)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFCBCBCB)),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    style: AppStyle.inputStyles,
                    controller: logic.amountTC,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                    decoration: InputDecoration(
                        hintText: "Enter Amount",
                        hintStyle: AppStyle.hintStyles,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 9, left: 24),
                  child: Text(
                    "Notes",
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xFF535353)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFCBCBCB)),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    style: AppStyle.inputStyles,
                    controller: logic.notesTC,
                    decoration: InputDecoration(
                        hintText: "Enter Notes",
                        hintStyle: AppStyle.hintStyles,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  ),
                ),
                40.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        logic.submit();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(const Color(0xFF4DA51F)
                            // 设置边框颜色和宽度
                            ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // 设置边框颜色和宽度
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
