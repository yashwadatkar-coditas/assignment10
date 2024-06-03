sealed class AuthState {}

class RegisterInitial extends AuthState {}
class LoginInitial extends AuthState {}

class RegisterLoading extends AuthState {}
class LoginLoading extends AuthState {}

class RegisterSuccess extends AuthState {}
class LoginSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String error;
RegisterFailure({required this.error});}

class NavigateToHomeScreenState extends AuthState
{}