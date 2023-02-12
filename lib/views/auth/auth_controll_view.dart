import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_3/views/auth/signIn.dart';
import 'package:project_3/views/home/home.dart';

class AutControllView extends StatelessWidget {
  const AutControllView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something wen wrong"),
          );
        }
        // if (!snapshot.hasData) {
        //   return const Center(
        //     child: CircularProgressIndicator(
        //       color: primaryColor,
        //     ),
        //   );
        // }

        return snapshot.data == null ? const MyWidget() : const Home();
      }),
    );
  }
}
