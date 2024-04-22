import 'package:bmi_app/core/config/router/app_routes_name.dart';
import 'package:bmi_app/core/constants/app_assets.dart';
import 'package:bmi_app/core/constants/app_strings.dart';
import 'package:bmi_app/core/service/service_locator.dart';
import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/loading_indicator.dart';

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
            Column(
              children: [
                Text(
                  AppStrings.instance.signInScreenTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(ImagesManager.instance.hands),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SignInSuccessState) {
                      Navigator.pushNamed(context, AppRoutes.layoutScreen);
                    }
                    if (state is SignInFailureState) {
                     // Navigator.pushNamed(context, AppRoutes.register);
                    }
                    if (state is AuthLoadingState) {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: LoadingIndicator(),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () =>
                            context.read<AuthCubit>().signInAnonymously(),
                        child: const Text("TEST"));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
