import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';


///Generic input text

InputDecoration getInputDecoration({
  @required String label,
  String hint,
  bool error,
  Color hintColor,
  Widget suffixIcon,
  Widget prefixIcon,
  String suffix = "",
  Color color,
  Color bottomLabelColor,
   InputBorder border,
     Color fillColor,
   bool filled,
}) {
  return InputDecoration(
    hintText: hint,
    //#2C2C2C

    hintStyle: TextStyle(color:hintColor??  AppColors.whiteColor,),
    labelText: label,
    labelStyle: TextStyle(color: hintColor ?? AppColors.whiteColor,),
    hoverColor: AppColors.editTextFloatColor  ,
    fillColor:fillColor  ??Colors.transparent,
    filled: true,
    suffix: Text('$suffix'),

    suffixIcon: suffixIcon ?? Icon(Icons.keyboard_arrow_down,size: 0,color:AppColors.primaryColor,),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: bottomLabelColor ?? AppColors.whiteColor),
    ),

    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color:bottomLabelColor ?? AppColors.whiteColor),
    ),

    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color:hintColor ?? AppColors.whiteColor),
    ),

  );
}




class InputField extends StatelessWidget {
  const InputField({
    Key key,
    this.label,
    this.controller,
    FocusNode node,
    this.type,
    this.hint,
    this.color,
    this.focusedColor,
    this.maxLines,
    this.maxLength,
    this.obscureText,
    this.error,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.hintColor,
    this.textColor,
    this.message,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.filled,
    this.fillColor,
    this.textAlign,
    this.style,

    this.enabled = true,
    this.bottomLabelColor

  })  : _node = node,
        super(key: key);

  final TextEditingController controller;
  final FocusNode _node;
  final TextInputType type;

  final String label;
  final String hint;
  final String message;
  final bool obscureText;
  final bool error;
  final int maxLines;
  final int maxLength;
  final InputBorder border;
  final   Color fillColor;
  final bool filled;
  final TextAlign textAlign;

  final bool  enabled ;

  final   TextStyle style;

  /// The color of the border
  final Color color;


  /// The color of the border
  final Color bottomLabelColor;

  /// The color of the border and label when the input is focused
  final Color focusedColor;

  /// The color of the hint text
  final Color hintColor;

  /// The color of the input value
  final Color textColor;

  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) validator;

  final Widget prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        TextFormField(
          enabled: enabled,
          maxLines: maxLines ?? 1,
          controller: controller,
          focusNode: _node,
          textInputAction: textInputAction ?? TextInputAction.next,
          autocorrect: false,
          keyboardType: type,
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          validator: validator,
          style: style ?? TextStyle(
            fontSize: 12.0,
            color: textColor ?? AppColors.whiteColor,
            fontFamily: AppFonts.RegularFonts
          ),
          maxLength: maxLength,

          decoration: getInputDecoration(
              label: label,
              color: color,
              error: error,

              hint: hint,
              hintColor: hintColor,
              prefixIcon: prefixIcon,

              bottomLabelColor: bottomLabelColor,
              suffixIcon: suffixIcon),
            textAlign: textAlign ?? TextAlign.left

        ),

        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              message ?? '',
              style: TextStyle(
                fontSize: 12.0,
                color: error == true ? AppColors.errorColor : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
