import 'package:assignment10/features/auth/domain/repository/auth_user_repository.dart';

class AuthUserUsecase {
  final AuthUserRepository authUserRepository;

  AuthUserUsecase({required this.authUserRepository});

  Future<void> registerUserUsecase(String email, String password, String familyName , String givenName) async {
    await authUserRepository.registerUser(email:email, password: password,familyName: familyName,givenName: givenName );

   
  }

   Future<void> loginUserUsecase(String email , String password) async
    {
      await authUserRepository.loginUser(email: email, password: password);
    }
}