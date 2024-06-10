import 'dart:async';

import 'package:assignment10/dependency_injections/dependency_injections_container.dart';
import 'package:assignment10/features/settings/domain/usecase/user_stored_data_usecase.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_event.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc():super(UserInitial())
  {
    on<UserInitialEvent>(userInitialEvent);
  }

  FutureOr<void> userInitialEvent(UserInitialEvent event, Emitter emit) {
    emit(UserLoading());
    
      locator<UserStoredDataUsecase>().getUserStoredDataUseCase().listen(
        (user)
        {
          emit(UserLoaded(user));
        },
        onError: (error){
          print(error);
          emit(UserError(error));
        },
      );
      
    
  }
}