import 'package:flutter/material.dart';

import '../person_info_screen.dart';

class NurseDescription extends StatelessWidget {
  const NurseDescription({
    Key? key,
    required this.agrs,
  }) : super(key: key);

  final NurseDetailsArguments agrs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              "شرایط کاری پرستار:",
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "IranSans",
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            agrs.nurse.workCondition.toString(),
            style: const TextStyle(
                fontFamily: "IranSans", color: Colors.black, fontSize: 13),
          )
        ],
      ),
    );
  }
}
