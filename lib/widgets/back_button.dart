


import 'package:flutter/cupertino.dart';

///Generic Back button
class BackButtons extends StatelessWidget{


  final Function onPressed;
  BackButtons({this.onPressed});


  @override
  Widget build(BuildContext context) {



    return    GestureDetector(
      onTap: onPressed,
      child:   Image.asset(
        'assets/images/back.png',
        width: 46,
        height: 36,
      ),
    );
  }

}