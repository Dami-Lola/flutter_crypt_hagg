

import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';

class MarketItem extends StatelessWidget {
  final String img;
  final String title;
  final String amount;
  final String percentage;
  final String chartImg;

  MarketItem({@required this.img, @required this.title, this.chartImg, @required this.amount,this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child:Row(
          children: [
            Image.asset("assets/images/$img",width: 40,height: 40,),

            SizedBox(width: 10,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: AppFonts.RegularFonts,
                      fontSize: 13),),

                SizedBox(height: 5,),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$amount',
                        style: TextStyle(color: AppColors.blackColor,
                            fontFamily: AppFonts.RegularFonts,
                            fontSize: 9),),
                      TextSpan(
                        text: '$percentage'?? '',
                        style: TextStyle(color: AppColors.greenColor,
                            fontFamily: AppFonts.RegularFonts,
                            fontSize: 9),),
                    ],
                  ),
                )


              ],
            ),

            Spacer(),

            Image.asset("assets/images/$chartImg",width: 80,height: 23,),

          ],
        )

    );
  }
}

