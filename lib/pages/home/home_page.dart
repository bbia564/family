import 'package:family_finance/pages/home/widgets/home_tab.dart';
import 'package:family_finance/pages/home/widgets/itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:family_finance/res/colors.dart';
import 'package:family_finance/res/style.dart';

import 'home_logic.dart';

class HomePage extends GetView<TTHomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEDF7DE), AppColors.bgColor])),
          child: Column(
            children: [
              Text(
                "HOME",
                style: AppStyle.titleStyles,
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.toADDByType(0);
                    },
                    child: const HomeTab(
                      image: 'assets/images/ic_home_1.png',
                      text: 'Family',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.toADDByType(1);
                    },
                    child: const HomeTab(
                      image: 'assets/images/ic_home_2.png',
                      text: 'Personal',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.toReports();
                    },
                    child: const HomeTab(
                      image: 'assets/images/ic_home_3.png',
                      text: 'Reports',
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
            ],
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _familyWidget(),
              22.verticalSpace,
              _personWidget(),
            ],
          ),
        ))
      ],
    );
  }

  Widget _familyWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 23, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.verticalSpace,
          Text(
            "Family Expenses",
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFFA7A7A7)),
          ),
          5.verticalSpace,
          Obx(() => ListView.separated(
                itemCount: controller.familyPayList.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  var bean = controller.familyPayList[index];
                  return InkWell(
                    onTap: (){
                      Get.toNamed('/dddd',arguments: {"type":0,"bean":bean});
                    },
                    child: HomeItem(
                      bean: bean,
                      index: index + 1,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
              ))
        ],
      ),
    );
  }

  Widget _personWidget() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 23, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.verticalSpace,
          Text(
            "Personal Expenses",
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFFA7A7A7)),
          ),
          5.verticalSpace,
          Obx(() => ListView.separated(
                itemCount: controller.personPayList.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  var bean = controller.personPayList[index];

                  return InkWell(
                    onTap: (){
                      Get.toNamed('/dddd',arguments: {"type":1,"bean":bean});
                    },
                    child: HomeItem(
                      bean: bean,
                      index: index + 1,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
              ))
        ],
      ),
    );
  }
}
