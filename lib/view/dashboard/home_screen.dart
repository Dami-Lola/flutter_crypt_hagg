
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/dashboard/dashboard_items/market_item.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard_store.dart';


class HomeDashboard extends StatefulWidget {
  static const routeName = '/HomeDashboard';
  @override
  _HomeDashboard createState() => _HomeDashboard();
}

class _HomeDashboard extends State<HomeDashboard> {

  HomeDashboardStore store = HomeDashboardStore();



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading :false,
          leading: Container(
            padding: EdgeInsets.all(4),

            width: 60,
            height: 60,

            child:    Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.all(20),

              child:   Container(
                  width: 40,
                  height: 40,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:AppColors.avartarColor,)
              ),

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:AppColors.primaryColor,)
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.avartarColor,

            ),
          ),

          actions: [
            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.all(10),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: AppColors.editTextFloatColor,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.left,
                  ),

                ],
              ),
            )
          ],
        ),

        body:Container(

          child:  ListView(
              children: [
                //Horizontal list banner
                Container(
                    height: 178,
                    child: LiveList(
                      showItemInterval: Duration(milliseconds: 130),
                      showItemDuration: Duration(milliseconds: 130),
                      reAnimateOnVisibility: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:store.dashboardBanner.length ,
                      itemBuilder: ReUseAbleComponent.animationItemBuilder((
                              (index) =>
                                  Container(
                                    padding: EdgeInsets.only(right: 2,left: 4),
                                    child: Image.asset(store.dashboardBanner[index],fit: BoxFit.fill,height: 130,width: size.width-20,),
                                  )
                      ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                ),


                Container(
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: Text('Markets',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts),)
                ),



                ListView.builder(
                    shrinkWrap: true,
                    itemCount: store.marketUpdates.length ,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,
                        index) {
                      return  MarketItem(
                        title: store.marketUpdates[index].title,
                        img: store.marketUpdates[index].img,
                        chartImg: store.marketUpdates[index].chartImg,
                        percentage: store.marketUpdates[index].percentage,
                        amount: store.marketUpdates[index].amount,
                      );
                    })



              ],
            ),

        )
    );
  }

}