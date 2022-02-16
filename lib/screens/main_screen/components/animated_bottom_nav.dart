import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'bottom_nav_item.dart';

class AnimatedBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;
  const AnimatedBottomNav(
      {Key? key, required this.currentIndex, required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kBaseColor1,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 47,
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => onChange(0),
                child: BottomNavItem(
                  icon: Icons.home,
                  title: "آگهی ها",
                  
                  isActive: currentIndex == 0,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => onChange(1),
                child: BottomNavItem(
                  icon: Icons.verified_user,
                  title: "استان ها",
                  isActive: currentIndex == 1,
                ),
              ),
            ),
            /*   Expanded(
              child: InkWell(
                onTap: () => onChange(1),
                child: BottomNavItem(
                  icon: Icons.verified_user,
                  title: "پروفایل",
                  isActive: currentIndex == 1,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
