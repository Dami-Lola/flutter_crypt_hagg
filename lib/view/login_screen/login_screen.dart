import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/snackbar.dart';
import 'package:flutter_crypt_hagg/view/create_account/createAccount_screen.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';
import 'package:flutter_crypt_hagg/widgets/input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'login_store.dart';



class  LoginScreen extends StatefulWidget{
  static const routeName = '/LoginScreen';
  @override
  _LoginPage createState()  =>  _LoginPage();

}

class _LoginPage extends State<LoginScreen>{
  LoginStore store = LoginStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container (
          child: Stack(
            children: [
              //background component
              ReUseAbleComponent.backgroundImage(context),
              Center(
                child:   Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: SingleChildScrollView(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 15),
                            child:  Text('Welcome!',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 40),)
                        ),
                        SizedBox(height: 25,),
                        Observer(
                          builder: (_) =>
                              InputField(
                                type: TextInputType.text,
                                label: 'Email Address',
                                onChanged: (v) => store.email = v,
                                message: store.error.email,
                                error: store.error.email != null,
                              ),
                        ),
                        SizedBox(height: 10,),
                        Observer(
                          builder: (_) =>
                              InputField(
                                type: TextInputType.visiblePassword,
                                label: 'Password (Min. 8 characters)',
                                onChanged: (v) => store.password = v,
                                message: store.error.password,
                                error: store.error.password != null,
                                obscureText: store.passwordVisible,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: GestureDetector(
                                    onTap: () => store.passwordVisible
                                        ? store.passwordVisible = false
                                        : store.passwordVisible = true,
                                    child: Icon(
                                      store.passwordVisible ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),

                              ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 35),
                            alignment: Alignment.topRight,
                            child:  Text('Forgot Password?!',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.RegularFonts,fontSize: 11),)
                        ),
                        SizedBox(height: 20,),


                    Observer(
                      builder: (ctx) =>
                          Container(
                          width: double.infinity,
                          child:  Button(
                            text: 'LOG IN',
                            onPressed: () {
                              store.submit(context: context,e:(e){
                                showSnackBar(
                                  ctx,
                                  message: e,
                                );
                              });
                            },
                            loading: store.loading,
                            loaderColor: AppColors.primaryColor,
                            color: AppColors.accentsColor,
                          ),
                        )
                    ),



                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(CreateAccountScreen.routeName);
                          },
                          child:   Container(
                            margin: EdgeInsets.only(top: 20 ),
                            child: Text('New User?Create a new account',style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.RegularFonts),)
                            ,
                          ),
                        )

                      ],

                    ),
                  )
                ),
              )
            ],
          )
      ),
    );
  }
}