import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData? theme() {
    return ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff1E1E1E),
      ),
      iconTheme: const IconThemeData(color: Colors.green),
      dialogTheme:  DialogTheme(backgroundColor: const Color(0xff282A2C),shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r)
      )),
      appBarTheme: AppBarTheme(
          scrolledUnderElevation:0, 
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 22.sp,
            color: Colors.green,
          ),
          centerTitle: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        
          style: ElevatedButton.styleFrom(
        disabledBackgroundColor:const Color(0xff282A2C),
        disabledForegroundColor: Colors.white10,
        fixedSize: Size(double.maxFinite, 50.h),
        shadowColor: Colors.green,
        elevation: 4,
        
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 12.sp, color: Colors.grey[900]))),
      hintColor: const Color(0xff838383),
      primaryColor: Colors.green,
      cardColor: const Color(0xff282A2C),
      scaffoldBackgroundColor: const Color(0xff1E1E1E),
      dividerColor: Colors.grey[900],
      shadowColor: Colors.black,
      highlightColor: const Color(0xffF5F5F5),
      textTheme: textTheme(),
    );
  }

  static TextTheme textTheme() {
    return TextTheme(
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
      bodyLarge: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.normal,
        fontSize: 18.sp,
      ),
      bodyMedium: TextStyle(
        color:  Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
      bodySmall: TextStyle(
        color: const Color(0xff838383),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    );
  }
}
