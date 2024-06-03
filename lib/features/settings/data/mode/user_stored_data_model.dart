import 'package:assignment10/features/settings/domain/entity/user_stored_data_entity.dart';

class UserDataStoredModel extends UserStoredDataEntity
{
  final String email;
  final String familyName;
  final String givenName;
  final String password;
  UserDataStoredModel(this.email, this.familyName, this.givenName, this.password):super(email: email,familyName: familyName,givenName: givenName,password: password);
}