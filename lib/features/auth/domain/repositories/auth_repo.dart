abstract class AuthRepo {
  Future<void> registerUser({required String email, required String password});
}
