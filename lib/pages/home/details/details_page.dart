import 'package:family_finance/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:family_finance/pages/home/details/details_controller.dart';

class DetailsPagePage extends GetView<DetailsController> {
  const DetailsPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAILS"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16.sp, color: const Color(0XFF0F0F0F)),
                child: Row(
                  children: [
                    10.horizontalSpace,
                    Image.asset(
                      controller.bean.image,
                      width: 30.w,
                      height: 30.w,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text("${controller.bean.type} (${controller.bean.count})",
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: Obx(() => ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      var text = controller.list[index];
                      return ListTile(
                        title: Text(
                          text.time,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeText),
                        ),
                        subtitle: Text(text.notes ?? "",
                          style: const TextStyle(fontSize: 12, color: Color(0xFF8D8D8D)),
                        ),
                        trailing: Text(
                          "${text.amount}",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeText),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                    itemCount: controller.list.length,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
