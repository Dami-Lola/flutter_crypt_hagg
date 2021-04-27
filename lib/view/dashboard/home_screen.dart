
import 'package:auto_animated/auto_animated.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/dashboard/dashboard_items/market_item.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


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
          toolbarHeight: 170,
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading :false,

          title: Container(
            height: 170,
            padding: EdgeInsets.all(10),
            child:Column(

              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CircleAvatar(

                      backgroundColor: AppColors.avartarColor,

                      child: Material(
color: AppColors.avartarColor,
                        shape: CircleBorder(

                            side: BorderSide( width: 3, color: AppColors.primaryColor,)
                        ),
                        child: Container(

                          margin: EdgeInsets.all(10),
                          child: Text("NY"
                            ,style: TextStyle(color: AppColors.primaryColor,fontFamily: AppFonts.BoldFonts,fontSize: 12),

                          ),
                        )
                      ),
                    ),

                    Spacer(),
                    Text(
                      '\nHaggleX'
                        ,style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 18),

                    ),

                    Spacer(),

                   Container(
                     width: 26,
                     height: 26,
                     child:  CircleAvatar(

                       backgroundColor:AppColors.FaintAccentColor ,
                       child:  Badge(
                         badgeColor: AppColors.errorColor,
                         padding: EdgeInsets.symmetric(horizontal: 5),
                         badgeContent: Text('5',style: TextStyle(color: AppColors.whiteColor),),
                         child: Icon(Icons.notifications,color: AppColors.whiteColor,size: 18,),
                       ),
                     ),
                   )
                  ],
                ),

                Row(
                  children: [

                    Observer(
                      builder: (_) =>
                          Container(
                            width: 90,
                            height: 31,

                            child: Row(
                              children: [


                                GestureDetector(
                                  onTap: () =>
                                  store.currencySwitch  = CurrencySwitch.USD ,
                                  child: Container(
                                      width: 43,
                                      margin: EdgeInsets.all(4),

                                      alignment: Alignment.center,
                                      child: Text("USD",
                                        style: TextStyle(fontSize: 10,
                                            color:AppColors.primaryColor),),

                                      decoration: BoxDecoration(
                                          color: store.currencySwitch  == CurrencySwitch.USD
                                              ?  AppColors.accentsColor
                                              :  AppColors.whiteColor,
                                          border: Border.all(
                                            color: store.currencySwitch  == CurrencySwitch.USD

                                                ?  AppColors.accentsColor
                                                : AppColors.whiteColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))
                                      )
                                  ),
                                ),



                                GestureDetector(
                                  onTap: () =>
                                   store.currencySwitch  = CurrencySwitch.NGN,

                                child: Container(
                                      width: 43,
                                       margin: EdgeInsets.all(4),
                                      child: Text("NGN",
                                        style: TextStyle(fontSize: 10,
                                            color:  AppColors.primaryColor),),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: store.currencySwitch  == CurrencySwitch.NGN
                                              ?  AppColors.primaryColor:   AppColors.whiteColor,
                                          border: Border.all(
                                            color: store.currencySwitch  == CurrencySwitch.NGN

                                                ?  AppColors.primaryColor
                                                :   AppColors.whiteColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))
                                      )
                                  ),
                                )

                              ],
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border: Border.all(
                                  color: AppColors.whiteColor
                                ),
                                borderRadius: BorderRadius.all(Radius
                                    .circular(60))
                            ),

                          ),
                    ),
                  ],
                )

              ],
            ),
          ),

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
                    }),

                Container(
                    padding: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                    child: Text('Markets',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts),)
                ),

              ],
            ),



        )
    );
  }

}