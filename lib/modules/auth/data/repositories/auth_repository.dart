import 'package:bmi_app/modules/auth/data/datasources/base_auth_data_source.dart';
import 'package:bmi_app/modules/auth/data/repositories/base_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/auth_failure.dart';
import '../../../../core/errors/failure.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthDataSource _dataSource;

  AuthRepository(this._dataSource);
  @override
  Future<Either<Failure, void>> signInAnonymously() async {
    try {
      final result = await _dataSource.signInAnonymously();
      return Right(result);
    } on FirebaseAuthException catch (error) {
      return Left(AuthFailure.fromFirebaseAuthException(error));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async => await signOut();
}
