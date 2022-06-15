import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ios_final/Widgets/widgets.dart';

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
                  SizedBox(height: 10,),
                  Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 20,)
                ],
              ),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    ));
  }
}

