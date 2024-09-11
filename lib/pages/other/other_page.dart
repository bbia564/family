import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:family_finance/res/style.dart';
import '../../res/colors.dart';
import 'controller.dart';

class OtherPage extends GetView<OtherController> {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFEDF7DE), AppColors.bgColor])),
          padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 20, bottom: 10),
          child: SizedBox(
            height: 40,
            child: Text(
              "SETTING",
              textAlign: TextAlign.center,
              style: AppStyle.titleStyles,
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                  "assets/images/ic_del.png",
                  width: 18,
                ),
                minLeadingWidth: 18,
                title: Text('Clean Data',
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w600)),
                onTap: () {
                  controller.onCleanData();
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 20,
                height: 1,
              ),
              ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 1),
                  child: Icon(
                    Icons.privacy_tip,
                    color: AppColors.themeColor,
                    size: 15,
                  ),
                ),
                minLeadingWidth: 18,
                title: Text("Privacy",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFAAAAAA), size: 14),
                onTap: () {
                  controller.onPrivacy(context);
                },
              ),
              const Divider(
                indent: 16,
                endIndent: 20,
                height: 1,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/ic_privacy.png",
                  width: 18,
                ),
                minLeadingWidth: 18,
                title: Text("About",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFAAAAAA), size: 14),
                onTap: () {
                  controller.onAbout();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
