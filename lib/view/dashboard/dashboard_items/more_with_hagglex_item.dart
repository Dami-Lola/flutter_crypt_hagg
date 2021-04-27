

import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';

class MoreWithHagglexItem extends StatelessWidget {
  final String img;
  final String title;
  final String desc;


  MoreWithHagglexItem({@required this.img, @required this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return    Container(

      height: 80,
   
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 16),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,

        elevation: 0,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child:   Image.asset('assets/images/$img',width: 40,height: 40,),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: <InlineSpan>[

                TextSpan(
                  text:'$title\n'
                  ,style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts,fontSize: 13),
                ),

                TextSpan(
                    text: '$desc',
                    style: TextStyle(color: AppColors.blackColor,fontSize: 9,fontFamily: AppFonts.LightFonts)),


              ]),
            )
          ],
        ),
        shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.all( Radius.circular(5))),
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

