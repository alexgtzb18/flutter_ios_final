import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 6, 31),
        ),
        body: Container(
          color: Color.fromARGB(255, 0, 78, 134),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                trailing: Icon(CupertinoIcons.right_chevron, color: Colors.white,),
                title: Text(
                  'Users List',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'users');
                },
              ),
              Divider(height: 5, color: Colors.white,)
            ],
          ),
        ));
  }
}
