
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/login_screen/login_screen.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';
import 'package:provider/provider.dart';
import 'constant/ReuseableComponent.dart';
import 'constant/colors.dart';

class LogoOut extends StatefulWidget {
  static const routeName = '/LogoOut';

  @override
  _Screen12State createState() => _Screen12State();
}

class _Screen12State extends State<LogoOut> {




  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    return Scaffold(
        body: Stack(
          children: [
            ReUseAbleComponent.backgroundImage(context),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Are you sure you want to log out?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                  SizedBox(
                    height: 40,
                  ),

                  Text(" We can't notify you of new request if you are logged out. ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),),

                  SizedBox(
                    height: 40,
                  ),




                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: 200,
                    child:  Button(
                      mode: ButtonMode.contained,
                      text: 'Exit app',
                      onPressed: () {
                        authStore.clearAuthStorage();
                        ///move to Login screen
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.routeName, (r) => false);
                      },

                      color: AppColors.errorColor,
                      textColor: AppColors.whiteColor,

                    ),
                  ),





                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    width: 200,
                    child:  Button(
                      mode: ButtonMode.contained,
                      text: 'Go back',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: AppColors.accentsColor,
                      textColor: AppColors.whiteColor,

                    ),
                  )


                ],
              ),
            ),
          ],
        )

    );

  }


}
