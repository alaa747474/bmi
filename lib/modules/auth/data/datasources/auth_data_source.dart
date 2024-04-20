import 'package:firebase_auth/firebase_auth.dart';

import 'base_auth_data_source.dart';

class AuthDataSource implements BaseAuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSource(this._auth);
  @override
  Future<void> signInAnonymously() async => await _auth.signInAnonymously();
  @override
  Future<void> signOut() async => await _auth.signOut();
}
