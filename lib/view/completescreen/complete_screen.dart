import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_parent_bottomnav.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';

import '../dashboard/home_dashboard/home_screen.dart';


class CompleteScreen extends StatefulWidget{
  static const routeName = '/CompleteScreen';
  @override
  _CompleteScreen createState()  =>  _CompleteScreen();
}
class _CompleteScreen extends State<CompleteScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container (
          child: Stack(
            children: [
              //background component
              ReUseAbleComponent.backgroundImage(context),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      'assets/images/mark_2.png',
                      width: 64,
                      height:64,
                    ),

                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child:  Text('Setup Complete',
                          style: TextStyle(color: AppColors.whiteColor,
                              fontFamily: AppFonts.BoldFonts,
                              fontSize: 16),)
                    ),

                    Text('Thank you for setting up your HaggleX account',
                      style: TextStyle(color:
                      AppColors.whiteColor,
                          fontFamily: AppFonts.RegularFonts,
                          fontSize: 9),),

                  ],
                ),
              ),

                Positioned(
                  bottom: 150,
                    left: 32,
                    right: 32,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child:  Button(
                        text: 'START EXPLORING',
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeParentDashboard.routeName, (r) => false
                          );
                        },
                        color: AppColors.accentsColor,
                      ),
                    ),
                )
            ],
          )
      ),
    );
  }
}