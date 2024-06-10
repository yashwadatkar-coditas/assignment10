sealed class AuthEvent {}
class RegisterButtonClickedEvent extends AuthEvent{
 final String email;
  final String password;
  final String givenName;
  final String familyName;

  RegisterButtonClickedEvent({required this.email, required this.password, required this.givenName, required this.familyName});


}


class LoginButtonClickedEvent extends AuthEvent 
{
  final String email;
  final String password;

  LoginButtonClickedEvent({required this.email, required this.password});
}