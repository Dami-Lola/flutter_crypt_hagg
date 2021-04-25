import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/create_account/createAccount_screen.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';
import 'package:flutter_crypt_hagg/widgets/input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';











class CompleteScreen extends StatefulWidget{
  static const routeName = '/CompleteScreen';

  @override
  _CompleteScreen createState()  =>  _CompleteScreen();

}


class _CompleteScreen extends State<CompleteScreen>{











  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(


      body:   Container (



          child: Stack(
            children: [
              //background component


              ReUseAbleComponent.backgroundImage(context),



              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [

                    Image.asset(
                      'assets/images/mark.png',
                      width: 64,
                      height:64,
                    ),



                    Container(

                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child:  Text('Setup Complete',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 16),)

                    ),


                    Text('Thank you for setting up your HaggleX account',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.RegularFonts,fontSize: 9),)



                  ],
                ),
              ),








            ],
          )
      ),
    );


  }




}