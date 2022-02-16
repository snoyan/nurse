import 'package:flutter/material.dart';

import '../../../data.dart';
import '../../../net/nurse_model.dart';
import '../../../net/welcome_screen.dart';
import 'person_card.dart';

class Advertising extends StatefulWidget {
  static List<Nurse> stateNurses = [];
  String selectedState;
  Advertising({required this.selectedState});

  @override
  State<Advertising> createState() => _AdvertisingState();
}

class _AdvertisingState extends State<Advertising> {
  stateNurseList() {
    Advertising.stateNurses = WelcomeScreen.nurseList
        .where((element) => element.state == widget.selectedState)
        .toList();
    print('stateNurses length:' + '${Advertising.stateNurses.length}');
    if (Advertising.stateNurses.isEmpty)
      Advertising.stateNurses = WelcomeScreen.nurseList;
    setState(() {});
  }

  @override
  void initState() {
    stateNurseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(children: [
          ...List.generate(
            Advertising.stateNurses.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PersonCard(
                  nurse: Advertising.stateNurses[index],
                ),
              );
            },
          ),
          const SizedBox(
            height: 330,
          )
        ]),
      ),
    );
  }
}
