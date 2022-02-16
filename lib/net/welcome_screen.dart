import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../models/user.dart';
import '../net/network.dart';
import '../net/nurse_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

import '../screens/ads/components/advertising.dart';
import '../screens/main_screen/main_screen.dart';
import 'rate_model.dart';

const spinkit = SpinKitPouringHourGlass(
  color: Colors.black,
  size: 50.0,
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String selectedState = '7';
  static List<Nurse> nurseList = [];
  static List<Rate> Rates = [];
  static List<User> users = [];
  static List<Nurse> filterdNurses = [];
  static bool isLogedin = false;
  static bool hasAds = false;
  static String routeName = '/welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = false;
  bool isActive = false;
  bool isTrying = false;

  /// this following function check " Is user device connected to network or not?".
  checkConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('your device is connected');
        setState(() {
          isTrying = false;
        });

        WelcomeScreen.nurseList = await Network().getNurseList();

        WelcomeScreen.Rates = await Network().getRate();
        //check is login or not
        SharedPreferences _prefs = await SharedPreferences.getInstance();

        if (_prefs.getString('token') == null ||
            _prefs.getString('token') == '') {
          WelcomeScreen.isLogedin = false;
          print('not login');
        } else {
          WelcomeScreen.isLogedin = true;
          print('is loged in');
        }
        //check has ads or not
        List hasNurse = WelcomeScreen.nurseList
            .where((element) => element.userId == _prefs.getInt('id'))
            .toList();
        if (hasNurse.isNotEmpty) {
          WelcomeScreen.hasAds = true;
          print('hasAds');
        } else {
          WelcomeScreen.hasAds = false;
          print('does not have ads');
        }
        WelcomeScreen.Rates = await Network().getRate();

        /*nursefilterSet() async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          print('${_prefs.getInt('id')}');
          if (_prefs.getString('selectedState') == null ||
              _prefs.getString('selectedState') == '') {
            _prefs.setString('selectedState', WelcomeScreen.selectedState);
          } else {
            WelcomeScreen.selectedState = _prefs.getString('selectedState')!;
            print('${WelcomeScreen.selectedState}');
          }
          WelcomeScreen.filterdNurses = await WelcomeScreen.nurseList
              .where((element) => element.userId == _prefs.getInt('id'))
              .toList();
          setState(() {});
          return WelcomeScreen.filterdNurses;
        }*/

        //nursefilterSet();
        if (_prefs.getString('selectedState') == null ||
            _prefs.getString('selectedState') == '') {
          _prefs.setString('selectedState', WelcomeScreen.selectedState);
        } else {
          MainScreen.selectedState =
              int.parse(_prefs.getString('selectedState')!);
        }

        Navigator.pushNamed(context, '/main_screen',
            arguments:
                HomeArg(WelcomeScreen.isLogedin, WelcomeScreen.hasAds, false));
      }
    } on SocketException catch (_) {
      print('your device is not connected');
      print(" اتصال به اینترت ندارید  \n دوباره تلاش کنید");
      setState(() {
        isTrying = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kBaseColor1,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/Background4.jpg'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText(
                        'توانمندسازی مردم برای بهبود زندگی خود  !',
                        textStyle: TextStyle(color: Colors.white)),
                    TyperAnimatedText('مراقبت استثنایی در نزدیکی شما !',
                        textStyle: TextStyle(color: Colors.white)),
                    TyperAnimatedText('مراقبت های بهداشتی عالی !',
                        textStyle: TextStyle(color: Colors.white)),
                    TyperAnimatedText('نزدیک به تو  !',
                        textStyle: TextStyle(color: Colors.white)),
                    TyperAnimatedText('مراقبت بهتر و درک بهتر !',
                        textStyle: TextStyle(color: Colors.white)),
                  ]),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'همیار',
                        cursor: '',
                        textStyle: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 300),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !isTrying
                          ? spinkit
                          : TryAgain(callBack: () {
                              checkConnection();
                            }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// the TryAgain is create to show TryAgain button when device disconnected
class TryAgain extends StatelessWidget {
  const TryAgain({Key? key, required this.callBack}) : super(key: key);
  final VoidCallback callBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          const Text('تلاش مجدد'),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 40.0,
            ),
            onPressed: callBack,
          ),
        ],
      ),
      onTap: callBack,
    );
  }
}
