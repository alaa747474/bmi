import 'package:bmi_app/modules/auth/data/datasources/auth_data_source.dart';
import 'package:bmi_app/modules/auth/data/datasources/base_auth_data_source.dart';
import 'package:bmi_app/modules/auth/data/repositories/auth_repository.dart';
import 'package:bmi_app/modules/auth/data/repositories/base_auth_repository.dart';
import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:bmi_app/modules/bmi_calculator/data/datasources/base_bmi_calculator_data_source.dart';
import 'package:bmi_app/modules/bmi_calculator/data/datasources/bmi_calculator_data_source.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/base_bmi_calculator_repository.dart';
import 'package:bmi_app/modules/bmi_calculator/data/repositories/bmi_calculator_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerLazySingleton<BaseAuthDataSource>(
      () => AuthDataSource(FirebaseAuth.instance));
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
  sl.registerLazySingleton<BaseBmiCalculatorDataSource>(() =>
      BmiCalculatorDataSource(
          FirebaseFirestore.instance, FirebaseAuth.instance));
  sl.registerLazySingleton<BaseBmiCalculatorRepository>(
      () => BmiCalculatorRepository(sl()));
}
