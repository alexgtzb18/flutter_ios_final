import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_final/ui/input_decorations.dart';
import 'package:flutter_ios_final/services/auth.dart';

class RegisterForm extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final auth _auth = auth();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else
                        return null;
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: 'abc@email.com',
                        labelText: 'Email',
                        prefixIcon: CupertinoIcons.at)),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '******',
                        labelText: 'Password',
                        prefixIcon: CupertinoIcons.lock)),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    style: TextStyle(color: Colors.white),
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '******',
                        labelText: 'Confirm Password',
                        prefixIcon: CupertinoIcons.lock)),
                SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                    color: Color.fromARGB(255, 0, 78, 134),
                    borderRadius: BorderRadius.circular(10),
                    child: Text('Register'),
                    onPressed: () {
                      // Navigator.pushReplacementNamed(context, 'users');
                      if (_key.currentState!.validate()) {
                        createUser();
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            )),
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 6, 31),
        ));
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _emailController.text, _passwordController.text);
    if (result == null) {
      print("Error");
    } else {
      print(result.toString());
    }
  }
}
