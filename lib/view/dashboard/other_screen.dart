
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/utils/logout.dart';
import 'package:flutter_crypt_hagg/widgets/button.dart';


class OtherDashboard extends StatefulWidget {
  final String page;
  OtherDashboard({@required this.page});
  @override
  _OtherDashboard createState() => _OtherDashboard();
}

class _OtherDashboard extends State<OtherDashboard> {







  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          toolbarHeight: 170,
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading :false,

          title: Container(
            height: 170,
            padding: EdgeInsets.all(10),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReUseAbleComponent.circularAvartar(title: "NR"),
                    Text(
                      '\nHaggleX'
                        ,style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 18),

                    ),
                   Container(
                     width: 26,
                     height: 26,
                     margin: EdgeInsets.only(right: 10),
                     child:  CircleAvatar(

                       backgroundColor:AppColors.FaintAccentColor ,
                       child:  Badge(
                         badgeColor: AppColors.errorColor,
                         padding: EdgeInsets.symmetric(horizontal: 5),
                         badgeContent: Text('5',style: TextStyle(color: AppColors.whiteColor,fontSize: 11),),
                         child: Icon(Icons.notifications,color: AppColors.whiteColor,size: 18,),
                       ),
                     ),
                   )
                  ],
                ),



               Container(
                 margin: EdgeInsets.symmetric(vertical: 30),
                 width: 200,
                 child:  Button(
                   mode: ButtonMode.contained,
                   text: 'SIGN OUT',
                   onPressed: () {
                     Navigator.of(context).pushNamed(LogoOut.routeName);
                   },
                   color: AppColors.accentsColor,
                   textColor: AppColors.blackColor,
                 ),
               )



              ],
            ),
          ),

        ),

        body:Container(

          child:  Center(
            child:  Text(
              '${widget.page}'
              ,style: TextStyle(color: AppColors.primaryColor,fontFamily: AppFonts.BoldFonts,fontSize: 18),

            ),
          )



        )
    );
  }

}