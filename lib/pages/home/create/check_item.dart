import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({super.key, required this.isCheck, required this.tag, required this.tagImage});

  final bool isCheck;
  final String tag;
  final String tagImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isCheck ? const Color(0xFF4DA51F).withOpacity(0.7) : const Color(0xFFF4F4F4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            tagImage,
            width: 14,
            height: 14,
          ),
          3.horizontalSpace,
          Text(
            tag,
            style: TextStyle(
                fontSize: 12.sp,
                color: isCheck ? Colors.white : const Color(0xFF0F0F0F),
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
