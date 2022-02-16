import 'package:flutter/material.dart';

import '../../../constant.dart';

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color? activeColor;
  final Color? inactiveColor;
  final String title;
  const BottomNavItem(
      {Key? key,
      this.isActive = false,
      required this.icon,
      this.activeColor,
      this.inactiveColor,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 200),
      child: isActive
          ? Container(
              ///color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  /// color: Colors.white,
                  fontFamily: "iransans",
                  fontWeight: FontWeight.bold,
                  color: activeColor ?? kBaseColor5,
                ),
              ),
            )
          : Icon(
              icon,
              color: inactiveColor ?? Colors.grey,
            ),
    );
  }
}
