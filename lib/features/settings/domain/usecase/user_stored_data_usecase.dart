import 'package:assignment10/features/settings/domain/entity/user_stored_data_entity.dart';
import 'package:assignment10/features/settings/domain/repository/user_stored_data_repository.dart';

class UserStoredDataUsecase {
  final UserStoredDataRepository userStoredDataRepository;

  UserStoredDataUsecase({required this.userStoredDataRepository});
  Stream<UserStoredDataEntity> getUserStoredDataUseCase ()
  {
    return userStoredDataRepository.getStoredUsersData();
  }
}