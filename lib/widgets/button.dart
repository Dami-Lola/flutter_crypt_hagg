
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';

enum ButtonMode { text, outlined, contained,gradient }

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.loaderColor,
    this.mode,
    this.loading,
    this.disabled,
    this.border,
  });

  final String text;
  final Function onPressed;
  final ButtonMode mode;
  final Color color;
  final Color textColor;
  final Color loaderColor;
  final bool loading;
  final bool disabled;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    Widget loader = SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(loaderColor ?? AppColors.buttonBlackColor),
      ),
    );

    if (mode == ButtonMode.outlined) {
      return OutlinedButton(


        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(


          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(BorderSide(color: color ?? AppColors.buttonBlackColor)),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
        ),
        child: loading == true
          ? loader
          : Text(
            text,
            style: TextStyle(
              fontSize: 12.0,
              color: textColor ?? color ?? AppColors.buttonBlackColor,
                fontFamily: AppFonts.BoldFonts

            ),
          ),
      );
    } else if (mode == ButtonMode.text) {
      return TextButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: textColor ?? AppColors.buttonBlackColor,
              fontFamily: AppFonts.BoldFonts),
        ),
      );
    } else if (mode == ButtonMode.gradient) {
      return  InkWell(


        onTap: (disabled == true || loading == true) ? null : onPressed,
        // style: ButtonStyle(
        //
        //   elevation: MaterialStateProperty.all(0),
        //   backgroundColor: MaterialStateProperty.all(color ?? AppColors.primaryColor),
        //   padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
        //
        // ),

        child:Container(
          alignment: Alignment.center,
          height: 55,

          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[AppColors.primaryColor, AppColors.gradientColor]
              ),
              color: AppColors.whiteColor,
              border: Border.all(

                color: AppColors.whiteColor,

              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(10))
          ),



          child:   loading == true
              ? loader
              : Text(
            text,
            style: TextStyle(
                fontSize: 11,
                color: textColor ?? AppColors.buttonBlackColor,
                fontFamily: AppFonts.BoldFonts),
          ),


        )
      );
    } else {
      return ElevatedButton(


        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(



          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(color ?? AppColors.primaryColor),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)),
        ),
        child: loading == true
          ? loader
          : Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                color: textColor ?? AppColors.buttonBlackColor,
                  fontFamily: AppFonts.BoldFonts),
            ),
      );
    }
  }
}
