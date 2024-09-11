import 'package:family_finance/pages/home/reports/family_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';

import '../../../res/colors.dart';

class FamilyReportsTab extends StatelessWidget {
  const FamilyReportsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FamilyReportsLogic>(
        init: FamilyReportsLogic(),
        builder: (logic) {
          return  Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: AppColors.themeColor, borderRadius: BorderRadius.circular(10)),
                child: DefaultTextStyle(
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              const Text("Total Expenditure"),
                              7.verticalSpace,
                              Obx(() =>
                                  Text(
                                    "${logic.totalEx}",
                                    style: const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )),
                      SizedBox(
                        height: 51,
                        child: VerticalDivider(
                          color: Colors.white.withOpacity(0.17),
                        ),
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              const Text("Total Transactions"),
                              7.verticalSpace,
                              Obx(() =>
                                  Text(
                                    "${logic.totalTr}",
                                    style: const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SimpleBarChart(
                  fullBarChartHeight: 300,
                  verticalInterval: 3000,
                  horizontalBarPadding: 10,
                  listOfHorizontalBarData: [
                    ...logic.familyReportsList.map(((e) =>
                        HorizontalDetailsModel(
                          name: e.type,
                          color: AppColors.themeColor,
                          size: e.money,
                        ))),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
