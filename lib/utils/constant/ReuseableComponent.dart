




 import 'package:flutter/material.dart';

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
 }