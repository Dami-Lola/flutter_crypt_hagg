import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_dashboard_store.dart';

///Generic Back button
class SwitchButtons extends StatelessWidget {
  final Function onPressed;
  final CurrencySwitch currency;
  final CurrencySwitch defaultCurrency;
  final String text;

  SwitchButtons(
      {this.onPressed,
      @required this.currency,
      @required this.text,
      @required this.defaultCurrency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: 43,
          margin: EdgeInsets.all(2),
          alignment: Alignment.center,
          child: Text(
            '$text',
            style: TextStyle(fontSize: 8, color: AppColors.primaryColor),
          ),
          decoration: BoxDecoration(
              color: currency == defaultCurrency
                  ? AppColors.accentsColor
                  : AppColors.whiteColor,
              border: Border.all(
                color: currency == defaultCurrency
                    ? AppColors.accentsColor
                    : AppColors.whiteColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)))),
    );
  }
}
