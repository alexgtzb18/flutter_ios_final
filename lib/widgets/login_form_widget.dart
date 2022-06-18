import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_final/ui/input_decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);
  static Future<User?> loginMailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User not found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Container(
        child: Form(
            child: Column(
          children: [
            TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'abc@email.com',
                    labelText: 'Email',
                    prefixIcon: CupertinoIcons.at)),
            SizedBox(
              height: 30,
            ),
            TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.white),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '******',
                    labelText: 'Password',
                    prefixIcon: CupertinoIcons.lock)),
            SizedBox(
              height: 30,
            ),
            CupertinoButton(
                color: Color.fromARGB(255, 0, 78, 134),
                borderRadius: BorderRadius.circular(10),
                child: Text('Login'),
                onPressed: () async {
                  User? user = await loginMailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    print("Login realizado com exito");
                    Navigator.pushReplacementNamed(context, 'menu');
                  } else {
                    print("Login fallo");
                  }
                }),
            SizedBox(
              height: 30,
            ),
            CupertinoButton(
                child: Text('Are you not register?'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'register');
                })
          ],
        )),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 6, 31),
        ));
  }
}
