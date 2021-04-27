




 import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';

class ReUseAbleComponent {



  ///To create a generic background
   static  backgroundImage( BuildContext context){

       final size = MediaQuery.of(context).size;
       return   Image.asset(

         'assets/images/splash_background.png',
         width: size.width,
         height: size.height,
         fit: BoxFit.fill,

       );
     }


   ///To make Listview animate
   static Widget Function(BuildContext context, int index, Animation<double> animation, )
   animationItemBuilder(Widget Function(int index) child, {EdgeInsets padding = EdgeInsets.zero,}) => (BuildContext context, int index, Animation<double> animation,) =>
       FadeTransition(
         opacity: Tween<double>(
           begin: 0,
           end: 1,
         ).animate(animation),
         child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: Padding(
                padding: padding,
                child: child(index),
              ),
            ),
          );

  ///decorator template for container
  static decorator({Color color, double circleRadius}) {
    return BoxDecoration(
        color: color ?? AppColors.whiteColor,
        border: Border.all(
          color: color ?? AppColors.whiteColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(circleRadius ?? 5)));
  }



  static circularAvartar({String title}){
    return     CircleAvatar(
      backgroundColor: AppColors.avartarColor,
      child: Material(
          color: AppColors.avartarColor,
          shape: CircleBorder(
              side: BorderSide( width: 3, color: AppColors.primaryColor,)
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("$title"
              ,style: TextStyle(color: AppColors.primaryColor,fontFamily: AppFonts.BoldFonts,fontSize: 12),
            ),
          )
      ),
    );
  }
}