import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    Key key,
    @required this.kheight,
    @required this.menus,
    @required this.currentPageIndex,
  }) : super(key: key);

  final double kheight;
  final List menus;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: kheight * 0.1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menus[0],
            style: currentPageIndex == 0
                ? kMenuItemTextStyle.copyWith(color: Colors.white)
                : kMenuItemTextStyle,
          ),
          Text(
            menus[1],
            style: currentPageIndex == 1
                ? kMenuItemTextStyle.copyWith(color: Colors.white)
                : kMenuItemTextStyle,
          ),
          Text(
            menus[2],
            style: currentPageIndex == 2
                ? kMenuItemTextStyle.copyWith(color: Colors.white)
                : kMenuItemTextStyle,
          ),
          Text(
            menus[3],
            style: currentPageIndex == 3
                ? kMenuItemTextStyle.copyWith(color: Colors.white)
                : kMenuItemTextStyle,
          )
        ],
      ),
    );
  }
}
