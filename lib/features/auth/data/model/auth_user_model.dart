import 'package:assignment10/features/auth/domain/entity/auth_user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthUserModel extends AuthUserEntity
{
  final String email;
  final String password;
  final String givenName;
  final String familyName;
  AuthUserModel({required this.email, required this.password, required this.givenName, required this.familyName}):super(email: email,passWord:password,givenName: givenName,familyName: familyName);


  factory AuthUserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;

    return AuthUserModel(
     email: data['email'],
     familyName: data['familyName'],
     givenName: data['givenName'],
     password: data['password'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'password': password,
      'givenName': givenName,
      'familyName': familyName,
    };
  }
}