import 'package:bmi_app/core/config/router/app_router.dart';
import 'package:bmi_app/core/config/router/app_routes_name.dart';
import 'package:bmi_app/core/config/theme/app_theme.dart';
import 'package:bmi_app/firebase_options.dart';
import 'package:bmi_app/modules/bmi_calculator/presentaion/cubit/bmi_calculator_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/my_bloc_boserver.dart';
import 'core/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => sl<BmiCalculatorCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BMI CALCULATOR',
          theme: AppTheme.theme(),
          initialRoute: AppRoutes.signIn,
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
