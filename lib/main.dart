
import 'package:assignment10/core/firebase_api/firebase_api.dart';
import 'package:assignment10/core/routes/app_routes_config.dart';
import 'package:assignment10/dependency_injections/dependency_injections_container.dart';

import 'package:assignment10/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_bloc.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_event.dart';
import 'package:assignment10/features/settings/presentation/bloc/user_state.dart';

import 'package:assignment10/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async
{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  setUp();
  
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      BlocProvider<UserBloc>(create: (context) => UserBloc()..add(UserInitialEvent())),
    ],
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

       routerConfig: MyAppRoutes().router,
    );
  }
}