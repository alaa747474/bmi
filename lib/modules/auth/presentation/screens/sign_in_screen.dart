import 'package:bmi_app/core/components/loading_indicator.dart';
import 'package:bmi_app/core/config/router/app_routes_name.dart';
import 'package:bmi_app/core/constants/app_assets.dart';
import 'package:bmi_app/core/constants/app_strings.dart';
import 'package:bmi_app/core/service/service_locator.dart';
import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AuthCubit>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.green.withOpacity(0.09),
                Colors.yellowAccent.withOpacity(0.09)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppStrings.instance.signInScreenTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Image.asset(ImagesManager.instance.hands),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SignInSuccessState) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.layoutScreen, (v) => false);
                      }
                      if (state is SignInFailureState) {}
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const LoadingIndicator();
                      }
                      return ElevatedButton(
                          onPressed: () =>
                              context.read<AuthCubit>().signInAnonymously(),
                          child: const Text("Sign In Anonymously"));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
