import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String id;
  final String name;
  final String age;
  final String address;
  final String school;
  final String gender;

  StudentModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.address,
      required this.school,
      required this.gender});

  factory StudentModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return StudentModel(
      id: snapshot.id,
      name: (snapshot.data() as Map)['name'],
      age: (snapshot.data() as Map)['age'] as String,
      address: (snapshot.data() as Map)['address'] as String,
      school: (snapshot.data() as Map)['school'] as String,
      gender: (snapshot.data() as Map)['gender'] as String,
    );
  }
}
