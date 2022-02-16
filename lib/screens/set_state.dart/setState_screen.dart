import 'package:flutter/material.dart';

import '../../data.dart';
import '../main_screen/main_screen.dart';

class SetState extends StatefulWidget {
  const SetState({Key? key}) : super(key: key);
  static String routeName = '/state';

  @override
  _SetStateState createState() => _SetStateState();
}

class _SetStateState extends State<SetState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            child: const Text(
              'انتخاب استان',
              style: TextStyle(
                  fontFamily: 'iransans', fontSize: 22, color: Colors.white),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                ...List.generate(
                    states.length,
                    (index) => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            onTap: () {
                              if (states.any((element) => element.isSelected)) {
                                for (int i = 0; i < states.length; i++)
                                  states[i].isSelected = false;
                                setState(() {
                                  states[index].isSelected == false
                                      ? (states[index].isSelected = true)
                                      : states[index].isSelected = false;
                                  MainScreen.selectedState = index;
                                });
                              } else {
                                setState(() {
                                  states[index].isSelected == false
                                      ? states[index].isSelected = true
                                      : states[index].isSelected = false;
                                  MainScreen.selectedState = index;
                                });
                              }
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              margin: EdgeInsets.only(bottom: 1),
                              color: states[index].isSelected
                                  ? Colors.red[100]
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5),
                                child: Text(
                                  states[index].stateName.toString(),
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.68),
                                      fontSize: 19.0,
                                      fontFamily: 'iransans'),
                                ),
                              ),
                            ),
                          ),
                        )),
                SizedBox(
                  height: 95,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
