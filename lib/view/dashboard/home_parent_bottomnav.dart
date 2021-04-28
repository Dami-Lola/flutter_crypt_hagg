
import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/store/auth_store/auth_store.dart';
import 'package:flutter_crypt_hagg/view/completescreen/userProfileStore.dart';
import 'package:flutter_crypt_hagg/widgets/custom_bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'home_dashboard/home_screen.dart';
import 'other_screen.dart';



class HomeParentDashboard extends StatefulWidget {
  static const routeName = '/HomeParentDashboard';

  @override
  _HomeParentDashboard createState() => _HomeParentDashboard();
}

class _HomeParentDashboard extends State<HomeParentDashboard> {
  int _selectedIndex = 0;


  List _widgetOptions = [

    HomeDashboard(),
    OtherDashboard(page: "Wallets Screens",),
    OtherDashboard(page: "CryptoSave Screens",),
    OtherDashboard(page: "More Screens",),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    UserProfileStore().submit(authStore: authStore,context: context);
    return Scaffold(

        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,

          onChange: (index) =>_onItemTapped(index),
          children: [
            CustomBottomNavigationItem(
              icon: 'home.png',
              label: 'Home',
            ),
            CustomBottomNavigationItem(
              icon: 'wallets.png',
              label: 'Wallets',
            ),



            CustomBottomNavigationItem(
              icon: 'cryptosave.png',
              label: 'CryptoSave',
            ),
            CustomBottomNavigationItem(icon: 'more.png', label: 'More'),
          ],
        )




    );
  }
}
