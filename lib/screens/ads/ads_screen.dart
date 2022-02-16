// ignore_for_file: implementation_imports, avoid_print

import 'package:flutter/material.dart';

import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constant.dart';
import '../../data.dart';
import '../../net/welcome_screen.dart';
import '../main_screen/main_screen.dart';
import 'components/advertising.dart';
import 'components/my_title.dart';
import 'components/top_nurse.dart';

class AdsScreen extends StatefulWidget {
  AdsScreen({
    required this.stateindex,
    Key? key,
  }) : super(key: key);
  static String routeName = '/ads_screen';
  int stateindex;
  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        children: [
          HeadLine(stateIndex: widget.stateindex),
          const MyTitle(label: 'همیاران برتر'),
          const TopNurse(),
          const MyTitle(label: 'آگهی ها'),
          Advertising(selectedState: widget.stateindex.toString()),
        ],
      ),
    );
  }
}

class HeadLine extends StatelessWidget {
  HeadLine({
    required this.stateIndex,
    Key? key,
  }) : super(key: key);
  int stateIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              states[stateIndex].stateName,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'iransans'),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: FloatingActionButton.small(
                  heroTag: const Text('btn2'),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, "/search_screen");
                  },
                  child: const Icon(
                    Icons.search,
                    color: kBaseColor5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: FloatingActionButton.small(
                  heroTag: const Text('btn3'),
                  backgroundColor: Colors.black,
                  onPressed: () async {
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    _prefs.remove('token');
                    _prefs.remove('id');
                    WelcomeScreen.isLogedin = false;
                    WelcomeScreen.hasAds = false;
                    Navigator.pushNamedAndRemoveUntil(
                        context, MainScreen.routeName, (route) => false,
                        arguments: HomeArg(WelcomeScreen.isLogedin,
                            WelcomeScreen.hasAds, false));
                  },
                  child: const Icon(
                    Icons.login,
                    color: kBaseColor5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



// Padding(
//             padding: EdgeInsets.only(left: 10.0, right: 10.0),
//             child: Container(
//               height: 80,
//               color: kBaseColor1,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Wrap(
//                   children: List.generate(
//                     Nurses.length,
//                     (index) {
//                       return TopCard(
//                         nurse: Nurses[index],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),