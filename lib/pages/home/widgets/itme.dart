import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../entity/expend_bean.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.bean, required this.index});

  final ExpendBean bean;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: DefaultTextStyle(
        style:
        TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp, color: const Color(0XFF0F0F0F)),
        child: Row(
          children: [
            Text("$index", style: const TextStyle(color: Color(0xFFA7A7A7)),),
            10.horizontalSpace,
            Image.asset(
              bean.image,
              width: 18.w,
              height: 28.w,
            ),
            10.horizontalSpace,
            Expanded(
              child: Text("${bean.type}(${bean.count})", overflow: TextOverflow.ellipsis),
            ),
            Text("${bean.money}", textAlign: TextAlign.end, overflow: TextOverflow.ellipsis),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFFA8A8A8), size: 14),
          ],
        ),
      ),
    );
  }
}
