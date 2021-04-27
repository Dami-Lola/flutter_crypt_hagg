import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';

import '../dashboard/home_screen.dart';


class CountryScreen extends StatefulWidget{
  static const routeName = '/CountryScreen';
  @override
  _CountryScreen createState()  =>  _CountryScreen();
}
class _CountryScreen extends State<CountryScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container (

          child: Stack(
            children: [
              //background component
              ReUseAbleComponent.backgroundImage(context),



              Container(
                padding: EdgeInsets.only(top: 70,right: 16,left: 16),
                child: Column(
                  children: [



                    Container(


                        child: TextField(
                          autocorrect: true,
                          onChanged: (s){

                          },
                          style: TextStyle(color:  AppColors.whiteColor,),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email Here...',
                            suffixIcon: Icon(Icons.search,color: Colors.grey,),
                            hintStyle: TextStyle(color:Colors.grey),


                            labelStyle: TextStyle(color:Colors.white),
                            filled: true,
                            fillColor:  AppColors.primarySecondaryColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppColors.primarySecondaryColor, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppColors.primarySecondaryColor, width: 2),
                            ),
                          ),)
                    ),

                    Container(
                      margin:  EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      height: 1,
                      color: AppColors.primarySecondaryColor,
                    )
                  ],
                ),
              )


            ],
          )
      ),
    );
  }
}