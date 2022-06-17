import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ios_final/Widgets/widgets.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300),
            CardContainer(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Login',
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 30)),
                  SizedBox(height: 20),
                  LoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
