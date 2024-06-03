

import 'package:assignment10/features/Home/data/data_source/user_remote_data_source.dart';
import 'package:assignment10/features/auth/data/data_source/auth_user_remote_data_source.dart';
import 'package:assignment10/features/auth/data/repository_impl/auth_user_repository_impl.dart';
import 'package:assignment10/features/auth/domain/usecase/auth_user_usecase.dart';
import 'package:assignment10/features/settings/data/data_source/users_stored_data.dart';
import 'package:assignment10/features/settings/data/repository_impl/user_stored_data_repository_impl.dart';
import 'package:assignment10/features/settings/domain/repository/user_stored_data_repository.dart';
import 'package:assignment10/features/settings/domain/usecase/user_stored_data_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUp ()
{
  locator.registerSingleton(AuthUserRemoteDataSource());
  locator.registerSingleton(AuthUserRepositoryImpl());
  locator.registerSingleton(AuthUserUsecase(authUserRepository: locator<AuthUserRepositoryImpl>()));

  locator.registerSingleton( UsersStoredData());
  locator.registerSingleton(UserStoredDataRepositoryImpl());
  locator.registerSingleton(UserStoredDataUsecase(userStoredDataRepository: locator<UserStoredDataRepositoryImpl>()));
}