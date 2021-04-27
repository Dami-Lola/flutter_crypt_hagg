






import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class  UserLocale{


  ///get  country currency
  static fetchLocale(BuildContext context){
     Locale local = Localizations.localeOf(context);
     var format = NumberFormat.simpleCurrency(locale: local.toString());
     return format;
   }

}