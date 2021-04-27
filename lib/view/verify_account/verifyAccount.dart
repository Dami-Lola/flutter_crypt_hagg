import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/snackbar.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/completescreen/complete_screen.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount_store.dart';
import 'package:flutter_crypt_hagg/widgets/back_button.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';
import 'package:flutter_crypt_hagg/widgets/input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class  VerifyAccount extends StatefulWidget{
  static const routeName = '/VerifyAccount';
  @override
  _VerifyAccount createState()  =>  _VerifyAccount();

}

class _VerifyAccount extends State<VerifyAccount>{

  VerifyAccountStore  store = VerifyAccountStore();




  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    final authStore = Provider.of<AuthStore>(context);


    return Scaffold(
        body:  Stack(
          children: [
            //background component
            ReUseAbleComponent.backgroundImage(context),
            Padding(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: BackButtons(onPressed: (){
                          Navigator.of(context).pop();
                        },),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 45,left: 32, bottom: 20),

                          child: Text('Verify your account',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 22),)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30,left: 16,right: 16),
                        child:Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: SingleChildScrollView(
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 40,),
                                  Image.asset(
                                    'assets/images/mark.png',
                                    width: 64,
                                    height:64,
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 35,horizontal: 10),
                                      child:  Text('We just sent a verification code to your email. Please enter the code',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.RegularFonts,fontSize: 11),softWrap: true,textAlign: TextAlign.center,)
                                  ),
                                  Observer(
                                    builder: (_) =>
                                        InputField(
                                          bottomLabelColor: AppColors.editTextFloatColor,
                                          color: AppColors.blackColor,
                                          textColor: AppColors.blackColor,
                                          hintColor: AppColors.blackColor,
                                          type: TextInputType.text,
                                          label: 'Verification code',
                                          onChanged: (v) => store.pinCode = v,
                                          message: store.error.pinCode,
                                          error: store.error.pinCode != null,

                                        ),
                                  ),
                                  SizedBox(height: 30,),


                              Observer(
                                builder: (ctx) =>
                                  Container(
                                    width: double.infinity,
                                    child:  Button(
                                      mode: ButtonMode.gradient,
                                      text: 'VERIFY ME',
                                      onPressed: () {
                                        store.submitPin(context: context,authStore: authStore,e: (e){
                                          showSnackBar(ctx, message: e,);
                                        });

                                        },
                                      loading: store.loading,
                                      loaderColor: AppColors.primaryColor,
                                      textColor: AppColors.whiteColor,
                                    ),

                                  )
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(vertical: 45),
                                      child: Text('This code will expire in 10 minutes',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.RegularFonts,fontSize: 11),softWrap: true,textAlign: TextAlign.center,)
                                  ),
                                Observer(
                                builder: (ctx) =>
                                  InkWell(
                                    onTap: (){
                                      store.resendVerificationPin(authStore:authStore,email: authStore?.accessToken?.user?.email,
                                          m: (m){
                                        showSnackBar(ctx, message: m,);
                                      },
                                      isLoading: (isLoading){
                                        if(isLoading){


                                        }else{


                                        }
                                      }
                                      );
                                    },
                                    child:   Container(
                                        child: Text('Resend Code',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts,fontSize: 13,decoration:TextDecoration.underline ))
                                    ),
                                  )
                              )
                                ],
                              ),
                            )
                        ),
                        height: size.height/1.8,
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            border: Border.all(
                              color: AppColors.whiteColor,
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))
                        ),
                      )
                    ],

                  ),
                )
            ),
          ],
        )
    );
  }
}