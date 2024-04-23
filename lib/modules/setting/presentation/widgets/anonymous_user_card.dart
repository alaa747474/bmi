import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnonymousUserCard extends StatelessWidget {
  const AnonymousUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).cardColor,
        ),
        child:  Column(
          children: [
           Icon(Icons.person_2_rounded,color: Theme.of(context).primaryColor,size: 85.r,),
            Text("Anonymous user !",style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
    );
  }
}