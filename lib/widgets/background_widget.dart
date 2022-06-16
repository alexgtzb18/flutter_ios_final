import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 0, 41, 70), 
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        _HeaderIcon(),

        this.child,
      ]),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 70),
        child: Icon(
          CupertinoIcons.person_crop_square,
          color: Color.fromARGB(255, 0, 78, 134),
          size: 100,
        ),
      ),
    );
  }
}
