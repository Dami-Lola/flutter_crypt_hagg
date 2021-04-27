
import 'package:flutter/cupertino.dart';
import 'package:flutter_crypt_hagg/model/market_item.dart';
import 'package:mobx/mobx.dart';


import 'package:validators/validators.dart';




part 'home_dashboard_store.g.dart';

class HomeDashboardStore = _HomeDashboardStore with _$HomeDashboardStore;

abstract class _HomeDashboardStore with Store {

  ///dummy data to display banner images
  @observable
  List<String>  dashboardBanner = ["assets/images/slide_1.png","assets/images/slide_2.png","assets/images/slide_3.png","assets/images/slide_4.png"];


  ///swich for currency switch
  @observable
  CurrencySwitch currencySwitch  = CurrencySwitch.USD ;



///dummy daya for market
  @observable
  List<Market>  marketUpdates = [
    Market(img: 'haggle.png',title: 'Haggle (HAG)',
        chartImg: 'haggle_chart.png',amount: 'NGN 380',percentage: null),

    Market(img: 'bitcoin.png',title: 'Bitcoin (BTC)',
        chartImg: 'bitcoin_chart.png',amount: 'NGN 4,272,147.00',percentage: '+2.34%'),

    Market(img: 'ethereum.png',title: 'Ethereum (ETH)',
        chartImg: 'etherum_chart.png',amount: 'NGN 4,272,147.00',percentage:  '+2.34%'),

    Market(img: 'tether.png',title: 'Tether (USDT)',
        chartImg: 'tether_chart.png',amount: 'NGN 4,272,147.00',percentage:  '+2.34%'),

    Market(img: 'bitcoin_cash.png',title: 'Bitcoin Cash (BCH)',
        chartImg: 'bitcoin_cash_chart.png',amount: 'NGN 4,272,147.00',percentage:  '+2.34%'),

    Market(img: 'doggecoin.png',title: 'Dodgecoin (DOGE)',
        chartImg: 'doggecoin_chart.png',amount: 'NGN 4,272,147.00',percentage:  '+2.34%'),

    Market(img: 'litecoin_chart.png',title: 'Litecoin (LTC)',
        chartImg: 'litecoin_chart.png',amount: 'NGN 4,272,147.00',percentage:  '+2.34%'),

  ];


}


enum CurrencySwitch{
  NGN,
  USD
}
