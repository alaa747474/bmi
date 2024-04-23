import 'package:bmi_app/core/components/loading_indicator.dart';
import 'package:bmi_app/core/config/router/app_routes_name.dart';
import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          Navigator.pushReplacementNamed(context, AppRoutes.signIn);
        }
      },
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const LoadingIndicator();
        }
        return ElevatedButton(
            onPressed: () => context.read<AuthCubit>().signOut(),
            child: const Text("Log out"));
      },
    );
  }
}
