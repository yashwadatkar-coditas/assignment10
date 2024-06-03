import 'package:assignment10/features/settings/presentation/bloc/user_bloc.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc,UserState>(builder: (context, state) {
        switch(state.runtimeType)
        {
          case UserLoading :
          return Center(child: CircularProgressIndicator());

          case UserLoaded:
          final userLoadedState = state as UserLoaded;
          return Column(
            children: [
              Text(userLoadedState.user.givenName),
            ],
          );

          case UserError:
          final errorState = state as UserError;
          return Center(child: Text(errorState.message));

          default : return Center(child: Text('Page not found '));
        }
      },),
      
     
    );
  }
}