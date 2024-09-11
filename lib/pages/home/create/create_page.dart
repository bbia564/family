import 'package:family_finance/pages/home/create/personal_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'family_tab.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key, this.index = 0});

  final int index;

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: widget.index);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD"),
      ),
      body: Column(
        children: [
          10.verticalSpace,
          Container(
            color: Colors.white,
            child: TabBar(
              controller: tabController,
              tabs: const [
                Tab(text: 'Family Expenses'),
                Tab(text: 'Personal Expenses'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(
                controller: tabController,
                children: const [
                  FamilyExpensesTab(),
                  PersonalExpensesTab(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
