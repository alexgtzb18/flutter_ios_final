import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ios_final/ui/input_decorations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            child: Column(
          children: [
            TextFormField(
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
                child: Text('Entrar'),
                onPressed: () {}),
            SizedBox(
              height: 30,
            )
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
