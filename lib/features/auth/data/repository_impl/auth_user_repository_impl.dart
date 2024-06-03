
import 'package:assignment10/dependency_injections/dependency_injections_container.dart';
import 'package:assignment10/features/auth/data/data_source/auth_user_remote_data_source.dart';
import 'package:assignment10/features/auth/domain/repository/auth_user_repository.dart';

class AuthUserRepositoryImpl implements AuthUserRepository
{
  @override
  Future<void> registerUser({required String email, required String password, required String givenName, required String familyName}) async{
    // TODO: implement registerUser
    //throw UnimplementedError();
    await  locator<AuthUserRemoteDataSource>().registerUserToFirebase(email: email, password: password, givenName: givenName, familyName: familyName);
  }
  
  @override
  Future<void> loginUser({required String email, required String password}) async{
    // TODO: implement loginUser
    //throw UnimplementedError();
  await locator<AuthUserRemoteDataSource>().loginUserToFirebase(email: email, password: password);
  }
  
}