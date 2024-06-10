
abstract class AuthUserRepository {
  Future<void> registerUser({required String email, required String password, required String givenName , required String familyName});
  Future<void> loginUser({required String email , required String password});
}