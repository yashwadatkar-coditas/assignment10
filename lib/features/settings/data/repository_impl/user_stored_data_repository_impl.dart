import 'package:assignment10/dependency_injections/dependency_injections_container.dart';
import 'package:assignment10/features/Home/data/data_source/user_remote_data_source.dart';
import 'package:assignment10/features/settings/data/data_source/users_stored_data.dart';
import 'package:assignment10/features/settings/domain/entity/user_stored_data_entity.dart';
import 'package:assignment10/features/settings/domain/repository/user_stored_data_repository.dart';

class UserStoredDataRepositoryImpl implements UserStoredDataRepository
{
  @override
  Stream<UserStoredDataEntity> getStoredUsersData(){
    // TODO: implement getStoredUsersData
   //throw UnimplementedError();
  return  locator<UsersStoredData>().getStoredUsersDatafromRemote();

  }
  
}