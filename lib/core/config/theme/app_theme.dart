import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData? theme() {
    return ThemeData(

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 12.sp,color: Colors.grey[900])
          )
        ),
        hintColor: const Color(0xff838383),
        primaryColor: const Color(0xff91611E),
        cardColor: const Color(0xff2A2C36),
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.grey[900],
        shadowColor: Colors.black,
     
        highlightColor: const Color(0xffF5F5F5),
        textTheme: textTheme(),
        );
  }

  static TextTheme textTheme() {
    return  TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 36.sp,
      ),
 
    );
  }
}