import 'dart:async';

import 'package:assignment10/dependency_injections/dependency_injections_container.dart';

import 'package:assignment10/features/auth/domain/usecase/auth_user_usecase.dart';
import 'package:assignment10/features/auth/presentation/bloc/auth_event.dart';
import 'package:assignment10/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
AuthBloc():super(RegisterInitial())
{
  on<RegisterButtonClickedEvent>(registerButtonClickedEvent);
  on<LoginButtonClickedEvent>(loginButtonClickedEvent);
  

}

  FutureOr<void> registerButtonClickedEvent(RegisterButtonClickedEvent event, Emitter emit) async{
  emit(RegisterLoading());
   try{
    await locator<AuthUserUsecase>().registerUserUsecase(event.email, event.password, event.familyName, event.givenName);
    emit(RegisterSuccess());
    emit(NavigateToHomeScreenState());
  }
  catch(e)
  {
    emit(RegisterFailure(error: e.toString()));
  }
  }

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<AuthState> emit) async{
    emit(LoginLoading());
    print('loading');
    try{
      print('login usecase');
      await locator<AuthUserUsecase>().loginUserUsecase(event.email, event.password);
      print('login usecase done');
      emit(RegisterSuccess());
      emit(NavigateToHomeScreenState());
    }
    catch(e)
    {
      print(e);
      emit(RegisterFailure(error: e.toString()));
    }
  }
}