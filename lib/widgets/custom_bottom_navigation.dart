import 'package:flutter/material.dart';
import 'package:flutter_crypt_hagg/utils/constant/colors.dart';



const Color PRIMARY_COLOR = AppColors.primaryColor;
const Color BACKGROUND_COLOR = AppColors.whiteColor;


class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int) onChange;
  final int currentIndex;

  CustomBottomNavigationBar(
      {this.backgroundColor = BACKGROUND_COLOR,
        this.itemColor = PRIMARY_COLOR,
        this.currentIndex = 0,
        @required this.children,
        this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10),
      height: 70,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map((item) {
          var color = item.color ?? widget.itemColor;
          var icon = item.icon;
          var label = item.label;
          int index = widget.children.indexOf(item);
          return GestureDetector(
            onTap: () {
              _changeIndex(index);
            },

            child: Container(

              child:Column(
                children: [

                  Image.asset(
                      'assets/images/$icon',
                      height: 24,
                      width: 24,
                      color:widget.currentIndex == index?AppColors.primaryColor: Color(0xffB0B1B7)
                  ),

                  Text(label,style: TextStyle(color:widget.currentIndex == index?AppColors.primaryColor: Color(0xffB0B1B7),fontSize: 12,fontFamily: 'GothamMedium' ),)

                ],
              ),
            )
          );
        }).toList(),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final String icon;
  final String label;
  final Color color;

  CustomBottomNavigationItem(
      {@required this.icon, @required this.label, this.color});
}