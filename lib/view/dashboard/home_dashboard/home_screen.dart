
import 'package:auto_animated/auto_animated.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/model/more_item.dart';
import 'package:flutter_crypt_hagg/utils/constant/ReuseableComponent.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';
import 'package:flutter_crypt_hagg/utils/constant/fonts.dart';
import 'package:flutter_crypt_hagg/view/dashboard/dashboard_items/market_item.dart';
import 'package:flutter_crypt_hagg/view/dashboard/home_dashboard/home_dashboard_store.dart';
import 'package:flutter_crypt_hagg/widgets/SwitchButton.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../dashboard_items/more_with_hagglex_item.dart';

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
                  margin: EdgeInsets.only(bottom: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Observer(
                      builder: (_) =>
                        RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: <InlineSpan>[
                          TextSpan(
                              text: 'Total portfolio balance\n\n',
                              style: TextStyle(color: AppColors.whiteColor,fontSize: 9,fontFamily: AppFonts.LightFonts)),
                          TextSpan(
                              text:'${store.currency}'
                            ,style: TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.BoldFonts,fontSize: 25),
                          ),
                        ]),
                        )
                        ),

                      Observer(
                        builder: (_) =>
                            Container(
                                height: 34,
                                child: Row(
                                  children: [
                                    ///CUSTOM switch button
                                    SwitchButtons(
                                      defaultCurrency: CurrencySwitch.USD,
                                      text: 'USD',
                                      onPressed: () {
                                        store.currencySwitch = CurrencySwitch.USD;
                                      },
                                      currency: store.currencySwitch,
                                    ),
                                    SwitchButtons(
                                      defaultCurrency: CurrencySwitch.NGN,
                                      text: 'NGN',
                                      onPressed: () {
                                        store.currencySwitch = CurrencySwitch.NGN;
                                      },
                                      currency: store.currencySwitch,
                                    ),
                                  ],
                                ),
                                decoration: ReUseAbleComponent.decorator(
                                    color: AppColors.whiteColor, circleRadius: 60)),
                      ),
                    ],
                  ),
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
                    child: Text('Do more with HaggleX',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts),)
                ),

               ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.moreItems.length ,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,
                          index) {
                        return  MoreWithHagglexItem(
                          title: store.moreItems[index].title,
                          img: store.moreItems[index].img,
                          desc: store.moreItems[index].desc,
                        );
                      }),

                SizedBox(height: 30,),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 18,horizontal: 16),
                    child: Text('Trending crypto news',style: TextStyle(color: AppColors.blackColor,fontFamily: AppFonts.BoldFonts),)
                ),

                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7 ,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,
                        index) {
                      return   Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child:   Image.asset('assets/images/block_chain.png',width: 53,height: 59,),
                            ),

                            Expanded(
                                child:  Text('Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                                    style: TextStyle(color: AppColors.blackColor,
                                        fontFamily: AppFonts.RegularFonts,
                                        fontSize: 12)
                                ))



                          ],
                        ),
                      );
                    }),

                SizedBox(height: 30,),

                Container(



                )


              ],
            ),



        )
    );
  }

}