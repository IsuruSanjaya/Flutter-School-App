import 'package:flutter/material.dart';
import 'package:project_3/views/auth/auth_controll_view.dart';
import 'package:project_3/views/auth/register.dart';
import 'package:project_3/views/auth/signIn.dart';
import 'package:project_3/views/home/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
