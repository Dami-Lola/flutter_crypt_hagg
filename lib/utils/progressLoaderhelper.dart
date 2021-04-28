

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';




class HelperLoader {





  static Widget progressWidget(GlobalKey progressKey) {
    return Container(
        height: 56,
        child: Center(
          child: CircularProgressIndicator(
            key: progressKey,
          ),
        ));
  }






  static void startLoading(BuildContext context, [String message = "Please wait..."]){
    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    configLoading(set : AppColors.primaryColor);
    EasyLoading.show(status: message);
  }


  static void loadingSuccessful(String message){
    configLoading(set : Colors.green);
    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    EasyLoading.removeAllCallbacks();

  }

  static void loadingFailed(String message){

    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    EasyLoading.removeAllCallbacks();

  }

  static void toastFailed(String message){
    configLoading(set : Colors.red);
    EasyLoading.showError(message);


  }

  static void toastInfor(String message){
    configLoading(set : Colors.blueGrey);
    EasyLoading.showInfo(message);


  }



 static void configLoading({Color  set  = Colors.green} ) {
   EasyLoading.instance
     ..indicatorType = EasyLoadingIndicatorType.circle
     ..loadingStyle = EasyLoadingStyle.custom
     ..indicatorSize = 45.0
     ..radius = 10.0

     ..userInteractions = false
     ..progressColor = Colors.white
     ..backgroundColor = set
     ..indicatorColor = Colors.white
     ..textColor = Colors.white
     ..maskColor = Colors.blue.withOpacity(0.5)

     ..dismissOnTap = false
     ..customAnimation = CustomAnimation();

 }




}


class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,
      ) {
    double opacity = controller?.value ?? 0;
    return Opacity(
      opacity: opacity,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
