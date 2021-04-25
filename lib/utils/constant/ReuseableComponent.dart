




 import 'package:flutter/material.dart';

class ReUseAbleComponent {



   static  backgroundImage( BuildContext context){

       final size = MediaQuery.of(context).size;
       return   Image.asset(

         'assets/images/splash_background.png',
         width: size.width,
         height: size.height,
         fit: BoxFit.fill,

       );
     }

 }