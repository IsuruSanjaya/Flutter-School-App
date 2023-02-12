import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:project_3/controllers/auth_controller.dart";

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    final email = TextEditingController();
    final password = TextEditingController();
    final TextEditingController name = TextEditingController();

    final AuthContonller authController = AuthContonller();
    bool shouldLoad = false;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(25.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 16.0),
                child: Image.asset(
                  "assets/images/cow.jpeg",
                  height: 200,
                  width: 500,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 16),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
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
                        await authController.registerWithEmailAndPassword(
                            email.text, password.text, name.text, context);
                        setState(() {
                          shouldLoad = false;
                        });
                      }
                    },
                    child: Text('Submit '),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
