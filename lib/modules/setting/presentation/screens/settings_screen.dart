import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:bmi_app/modules/setting/presentation/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/service/service_locator.dart';
import '../widgets/anonymous_user_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child:  Column(
            children: [
              const AnonymousUserCard(),
              SizedBox.square(dimension: 16.h,),
              const SettingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
