import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_final/services/auth.dart';
import 'package:flutter_ios_final/ui/input_decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final auth _auth = auth();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _key,
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
                      if (_key.currentState!.validate()) {
                        loginUser(context: context);
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

  void loginUser({context}) async {
    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    if (authResult == null) {
      print("Error");
    } else {
      print(authResult.toString());
      Navigator.pushReplacementNamed(context, 'users');
    }
  }
}
