import 'package:assignment10/features/settings/data/mode/user_stored_data_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UsersStoredData {
  final firebaseRef = FirebaseDatabase.instance.ref();
  Stream<UserDataStoredModel> getStoredUsersDatafromRemote ()
  {
     return  firebaseRef.child('users').onValue.map((event)
      {
          final data = Map<String, dynamic>.from(event.snapshot.value as Map);
          
          return UserDataStoredModel(data['email'], data['familyName'], data['givenName'], data['password']);
      },
      );
  }
}