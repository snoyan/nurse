import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../data.dart';
import '../../../net/welcome_screen.dart';
import 'top_card.dart';

class TopNurse extends StatelessWidget {
  const TopNurse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Wrap(
              children: List.generate(
                WelcomeScreen.nurseList.length,
                (index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: TopCard(
                        nurse: WelcomeScreen.nurseList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Wrap(
//             children: List.generate(
//               Nurses.length,
//               (index) {
//                 return TopCard(
//                   nurse: Nurses[index],
//                 );
//               },
//             ),
//           ),
//         ),