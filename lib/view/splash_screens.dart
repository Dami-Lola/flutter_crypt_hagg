import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/login_screen/login_screen.dart';


class SplashScreens extends StatefulWidget {
  static const routeName = '/SplashScreens';
  @override
  _SplashScreenStates createState() => _SplashScreenStates();
}
class _SplashScreenStates extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut)
      ..addListener(() {
        if (animationController.isCompleted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.routeName, (r) => false);
        }

        setState(() {});
      });

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // generic background
            ReUseAbleComponent.backgroundImage(context),
           Container(
             alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: animation.value * 70,
                        height: animation.value * 70,
                      ),
                      SizedBox(height: 35,),
                      Text(
                        "HaggleX",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontFamily: AppFonts.BoldFonts),
                      )
                    ],
                  ),
                ),
          ],
        ));
  }
}



