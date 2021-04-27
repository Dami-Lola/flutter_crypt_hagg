import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/snackbar.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/verify_account/verifyAccount.dart';
import 'package:flutter_crypt_hagg/widgets/back_button.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';
import 'package:flutter_crypt_hagg/widgets/input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import 'createAccount_store.dart';


class  CreateAccountScreen extends StatefulWidget{
  static const routeName = '/CreateAccountScreen';
  @override
  _CreateAccountScreen createState()  =>  _CreateAccountScreen();
}
class _CreateAccountScreen extends State<CreateAccountScreen>{

  /// contain the business logic of this class and
  /// use mobx for state management and
  /// Observer is used to listing to any changes
  CreateAccountStore store = CreateAccountStore();



  @override
  void didUpdateWidget(covariant CreateAccountScreen oldWidget) {
    store.loadCountry();
    super.didUpdateWidget(oldWidget);
  }


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
                      //generic back button
                      Container(
                        child:BackButtons(onPressed: (){
                          Navigator.of(context).pop();
                        },),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30,left: 16,right: 16),
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: SingleChildScrollView(
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(bottom: 15),
                                        child:  Text('Create a new account',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts,fontSize: 16),)
                                    ),
                                    SizedBox(height: 25,),
                                    Observer(
                                      builder: (_) =>
                                          InputField(
                                            bottomLabelColor: AppColors.editTextFloatColor,
                                            color: AppColors.blackColor,
                                            textColor: AppColors.blackColor,
                                            hintColor: AppColors.blackColor,
                                            type: TextInputType.text,
                                            label: 'Email Address',
                                            hint:'Email' ,
                                            onChanged: (v) => store.email = v,
                                            message: store.error.email,
                                            error: store.error.email != null,
                                          ),
                                    ),
                                    SizedBox(height: 15,),
                                    Observer(
                                      builder: (_) =>
                                          InputField(
                                            bottomLabelColor: AppColors.editTextFloatColor,
                                            color: AppColors.blackColor,
                                            textColor: AppColors.blackColor,
                                            hintColor: AppColors.blackColor,
                                            type: TextInputType.visiblePassword,
                                            obscureText: true,
                                            label: 'Password (Min 8 characters)',
                                            hint:'Password' ,
                                            onChanged: (v) => store.password = v,
                                            message: store.error.password,
                                            error: store.error.password != null,

                                          ),
                                    ),
                                    SizedBox(height: 15,),
                                    Observer(
                                      builder: (_) =>
                                          InputField(
                                            bottomLabelColor: AppColors.editTextFloatColor,
                                            color: AppColors.blackColor,
                                            textColor: AppColors.blackColor,
                                            hintColor: AppColors.blackColor,
                                            type: TextInputType.text,
                                            label: 'Create a username',
                                            hint: 'Create a username',
                                            onChanged: (v) => store.userName = v,
                                            message: store.error.userName,
                                            error: store.error.userName != null,

                                          ),
                                    ),
                                    SizedBox(height: 15,),

                                    InternationalPhoneNumberInput(
                                      onInputChanged: (PhoneNumber number) {
                                        store.phoneNumber = number.phoneNumber;
                                      },
                                      selectorConfig: SelectorConfig(
                                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                      ),
                                      ignoreBlank: false,
                                      textStyle: TextStyle(
                                          fontSize: 12.0,
                                          color:AppColors.blackColor,
                                          fontFamily: AppFonts.RegularFonts),
                                      autoValidateMode: AutovalidateMode.disabled,
                                      selectorTextStyle: TextStyle(color: Colors.black),
                                      formatInput: true,
                                      hintText: 'Enter your phone number',
                                      keyboardType: TextInputType.numberWithOptions(
                                          signed: true, decimal: true),

                                    ),
                                    Observer(
                                        builder: (_) =>
                                            Text(store.error.phoneNumber ?? '',style: TextStyle(color: Colors.red,fontSize: 14),)
                                    ),


                                    SizedBox(height: 20,),


                                    ///since I am not validating this, I don't need to observer
                                    InputField(
                                      bottomLabelColor: AppColors.editTextFloatColor,
                                      color: AppColors.blackColor,
                                      textColor: AppColors.blackColor,
                                      hintColor: AppColors.blackColor,
                                      type: TextInputType.text,
                                      label: 'Referral code (optional)',
                                      onChanged: (v) => store.referralCode = v,
                                      message: store.error.referralCode,
                                      error: store.error.referralCode != null,
                                    ),



                                    SizedBox(height: 10,),
                                    Container(
                                        margin: EdgeInsets.symmetric(vertical: 35),
                                        child:  Text('By signing, you agree to HaggleX terms and privacy policy.',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.RegularFonts,fontSize: 11),)
                                    ),
                                    SizedBox(height: 20,),

                                    Observer(
                                        builder: (ctx) =>
                                            Container(
                                              width: double.infinity,
                                              child:  Button(
                                                mode: ButtonMode.gradient,
                                                text: 'SIGN UP',
                                                onPressed: () {
                                                  // Navigator.of(context).pushNamed(VerifyAccount.routeName);
                                                  store.submit(context: context,e: (message){
                                                    store.submit(context: context,e:(e){showSnackBar(ctx, message: e,);});
                                                  },
                                                      authStore: authStore
                                                  );
                                                },
                                                loading: store.loading,
                                                loaderColor: AppColors.primaryColor,
                                                textColor: AppColors.whiteColor,
                                              ),
                                            )
                                    ),
                                  ],

                                ),
                              )
                          ),
                        ),
                        height: size.height/1.3,
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