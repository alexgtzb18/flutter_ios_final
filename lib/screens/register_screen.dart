import 'package:flutter/material.dart';
import 'package:flutter_ios_final/widgets/register_form_widget.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ios_final/Widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
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
                  SizedBox(height: 10,),

                  Text('Register', style: TextStyle(color: Colors.grey.shade400, fontSize: 30)),

                  SizedBox(height: 20),

                  RegisterForm(),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

