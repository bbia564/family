import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppStyle {
  static final lightTheme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.themeColor,
      primaryColorDark: AppColors.themeText,
      primaryColorLight: Colors.white,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgColor,
      canvasColor: Colors.white,
      dividerColor: Colors.black.withOpacity(0.08),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        // scrolledUnderElevation: 0,
        titleTextStyle: titleStyles,
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.themeColor),
      tabBarTheme: TabBarTheme(
          indicatorColor: AppColors.themeColor,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, color: const Color(0xFF8D8D8D)),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: AppColors.themeText)),
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: AppColors.dividerC,
      ),
      listTileTheme: ListTileThemeData(
        textColor: AppColors.themeText,
        titleTextStyle: TextStyle(fontSize: 14.sp),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.r))),
      ));
  static const TextStyle lightText = TextStyle(
    color: Colors.white,
    // fontFamily: AppFonts.fontLight,
  );

//字体样式
  static TextStyle get titleStyles =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF0F0F0F));

  static TextStyle get hintStyles => TextStyle(fontSize: 12.sp, color: const Color(0xFFB9B9B9));

  static TextStyle get tipStyles =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: const Color(0xFF2B2B2B));

  static TextStyle get inputStyles =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF505050));

  static TextStyle get minTipStyle => TextStyle(fontSize: 12.sp, color: const Color(0xFFB9B9B9));

  static BoxDecoration get defDecoration =>
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r)), color: Colors.white);

  static BoxDecoration get outLineDecoration => BoxDecoration(
      border: Border.all(color: const Color(0xFFCBCBCB)), borderRadius: BorderRadius.circular(4));
}
