abstract class BaseAuthDataSource {
  Future<void> signInAnonymously();
  Future<void> signOut();
}
