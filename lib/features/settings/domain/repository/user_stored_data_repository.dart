
import 'package:assignment10/features/settings/domain/entity/user_stored_data_entity.dart';

abstract class UserStoredDataRepository 
{
  Stream<UserStoredDataEntity> getStoredUsersData ();
}