import 'package:bmi_app/modules/auth/data/datasources/auth_data_source.dart';
import 'package:bmi_app/modules/auth/data/datasources/base_auth_data_source.dart';
import 'package:bmi_app/modules/auth/data/repositories/auth_repository.dart';
import 'package:bmi_app/modules/auth/data/repositories/base_auth_repository.dart';
import 'package:bmi_app/modules/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void>setUpServiceLocator()async{
  sl.registerLazySingleton<BaseAuthDataSource>(() => AuthDataSource(FirebaseAuth.instance));
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(sl()));
}