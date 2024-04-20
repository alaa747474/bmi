import 'package:bmi_app/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFailure extends Failure {
  AuthFailure(super.error);
  factory AuthFailure.fromFirebaseAuthException(
          FirebaseAuthException firebaseAuthException) =>
      AuthFailure(AuthErrorModel(
        code: firebaseAuthException.code,
        message: firebaseAuthException.message,
        email: firebaseAuthException.email,
        phoneNumber: firebaseAuthException.phoneNumber,
      ));
}

class AuthErrorModel {
  String? message;
  String? email;
  String? phoneNumber;
  String? code;
  AuthErrorModel({
    this.message,
    this.email,
    this.phoneNumber,
    this.code,
  });
}
