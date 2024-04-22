import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData? theme() {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: 
          ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xff80F988),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
              
            ),
     
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(fontSize: 12.sp,color: Colors.grey[900])
          )
        ),
        hintColor: const Color(0xff838383),
        primaryColor: const Color(0xff80F988),
        cardColor: const Color(0xff282A2C),
        scaffoldBackgroundColor: const Color(0xff1E1E1E),
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
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 24.sp,
      ),
 
    );
  }
}