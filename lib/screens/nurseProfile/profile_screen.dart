import 'package:flutter/material.dart';
import 'components/edit_profile.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // The _onBackPressed is for back to HomeScreen and refresh it by press Android backButton.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text("پروفایل",
            style: TextStyle(color: Colors.black87, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(
              isEditAble: false,
            ),
            SizedBox(height: 20),
            ProfileMenu(
              text: "آگهی من",
              icon: "assets/icons/User.svg",
              press: () {
                Navigator.pushNamed(context, EditProfileScreen.routeName);
              },
            ),
            /*     ProfileMenu(
              text: "اعلان ها",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "تنظیمات",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "پشتیبانی",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),*/
            ProfileMenu(
              text: "خروج از حساب",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
