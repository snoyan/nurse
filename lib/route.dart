import 'package:flutter/material.dart';

import 'net/welcome_screen.dart';
import 'screens/ads/ads_screen.dart';
import 'screens/login/login_popup.dart';
import 'screens/main_screen/main_screen.dart';
import 'screens/nurseInfo/person_info_screen.dart';
import 'screens/nurseProfile/components/edit_profile.dart';
import 'screens/nurseProfile/profile_screen.dart';
import 'screens/nurse_signPage/nurse_signPage.dart';
import 'screens/search/search_screen.dart';
import 'screens/set_state.dart/setState_screen.dart';
import 'screens/signup/signup_popup.dart';

final Map<String, WidgetBuilder> myRoutes = {
  MainScreen.routeName: (context) => MainScreen(),
  AdsScreen.routeName: (context) =>
      AdsScreen(stateindex: MainScreen.selectedState),
  NurseInfo.routeName: (context) => NurseInfo(),
  SearchScreen.routeName: (cosntext) => const SearchScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SetState.routeName: (context) => const SetState(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  NurseSignUp.routeName: (context) => NurseSignUp()
};
