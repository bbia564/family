import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 50,
          height: 50,
        ),
        10.verticalSpace,
        Text(
          text,
          style: TextStyle(
              fontSize: 14.sp, color: const Color(0xFF0F0F0F), fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
