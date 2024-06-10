


import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthUserRemoteDataSource 
{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Future<void> registerUserToFirebase ({required String email , required String password , required String givenName , required String familyName}) async{
final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
final userId = userCredential.user!.uid;

await firebaseFirestore.collection('users').doc(userId).set(
{
  'email' : email,
  'password' : password,
  'givenName' : givenName,
  'familyName' : familyName,
},
);
}

Future<void> loginUserToFirebase ({required String email , required String password}) async 
{
 await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
}

}