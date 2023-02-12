import 'package:js/js.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_3/views/auth/auth_controll_view.dart';
import "package:project_3/controllers/auth_controller.dart";

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final AuthContonller authController = AuthContonller();
  bool shouldLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: Image.asset('assets/images/car.png',
                    height: 200, width: 200),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Enter the password"),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      shadowColor: Colors.greenAccent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize: Size(1000, 40), //////// HERE
                    ),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          shouldLoad = true;
                        });
                        await authController.signWithEmailAndPassword(
                            email.text, password.text, context);
                        setState(() {
                          shouldLoad = true;
                        });
                      }
                    },
                    child: Text('Submit '),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: Colors.black,
                      shadowColor: Colors.transparent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      minimumSize: Size(1000, 40),
                    ),
                    onPressed: () {},
                    child: Text('No  Account? Sign Up'),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: email.text.trim(),
  //     password: password.text.trim(),
  //   );
  // }
}
