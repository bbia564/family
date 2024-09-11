import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../db/db_service.dart';
import '../home/home_logic.dart';

class OtherController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAppInfo();
  }

  Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    // String appName = info.appName;
    // String packageName = info.packageName;
    version.value = info.version;
    // String buildNumber = info.buildNumber;
  }

  final db = Get.find<DatabaseService>();

  onAbout() async {
    var info = await PackageInfo.fromPlatform();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("About"),
          ),
          body: Column(
            children: [
              20.verticalSpace,
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/ic_launcher.png",
                    width: 70,
                  )),
              10.verticalSpace,
              Text(info.appName),
              5.verticalSpace,
              Text("v ${info.version}"),
              const Expanded(
                child: Markdown(
                  data: """
FamilyFinance: Your Ultimate Personal and Family Accounting App
Introduction

Welcome to FamilyFinance, the comprehensive solution for managing both your personal and family finances. Whether you're keeping track of individual expenses or managing household budgets, FamilyFinance offers a seamless and intuitive experience to help you stay on top of your finances.

Key Features

Add Family and Personal Accounts: Easily switch between managing family and personal finances with dedicated sections for each. Log expenses, income, and keep track of your financial health effortlessly.

Account Reports: Generate detailed reports to understand your spending habits, track savings, and make informed financial decisions. Our clear and concise reports help you stay on top of your finances.

Total Spend and Transactions: View your total expenditure and transaction history at a glance. FamilyFinance provides an overview of your financial activities, ensuring you are always aware of where your money is going.

User-Friendly Interface: Enjoy a clean, easy-to-use interface that makes financial management a breeze. Our app is designed to be intuitive, ensuring you spend less time managing finances and more time enjoying life.

Secure and Private: Your financial data is secure with us. FamilyFinance employs top-notch security measures to ensure your information is protected and private.

Why Choose FamilyFinance?

Comprehensive Management: Handle both personal and family finances in one place, making it easier to manage and track all your financial activities.
Insightful Reports: Gain valuable insights into your spending patterns and financial health with our detailed reports.
Ease of Use: Our intuitive design makes financial management accessible to everyone, regardless of their financial expertise.
Security First: Rest easy knowing your data is safe with FamilyFinance's robust security measures.
Get Started Today

Join the FamilyFinance community and take control of your financial future. Download FamilyFinance now and start managing your personal and family finances with ease.

FamilyFinance - Simplifying Financial Management for You and Your Family.
          """,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(
            data: """
#### Data Collection
Our app does not collect any personal information or user data. All triangle calculations are performed locally on the device and are not transmitted to any external servers.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """,
          ),
        );
      },
    );
  }

  onCleanData() async {
    Get.dialog(AlertDialog(
      title: const Text('Delete'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)), // 设置圆角
      ),
      content: const Text('Are you sure you want to delete all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await db.clean();
            Get.back();
            try {
              TTHomeLogic.to.clean();
            } catch (e) {}
          },
          child: const Text('Confirm'),
        ),
      ],
    ));
  }
}
