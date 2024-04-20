 import 'package:bmi_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseAuthRepository  {
   Future<Either<Failure,void>> signInAnonymously();
   Future<Either<Failure,void>> signOut();

}