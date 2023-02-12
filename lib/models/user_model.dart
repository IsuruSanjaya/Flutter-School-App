import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.id,
      email: (snapshot.data() as Map)['email'] as String,
      password: (snapshot.data() as Map)['password'] as String,
    );
  }
}
