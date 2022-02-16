// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../net/nurse_model.dart';
import '../../../net/rate_model.dart';
import '../../../net/welcome_screen.dart';
import '../../nurseInfo/person_info_screen.dart';

class TopCard extends StatefulWidget {
  final Nurse nurse;
  TopCard({
    required this.nurse,
    Key? key,
  }) : super(key: key);
  List<Rate> rated = [];
  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  setRate() {
    widget.rated = WelcomeScreen.Rates.where(
        (element) => element.userId == widget.nurse.userId).toList();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setRate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: const BoxDecoration(
              color: kBaseColor5,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Container(
            height: 76.0,
            width: 76,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Color.fromARGB(22, 0, 0, 0), width: 2),
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: kBaseColor5, width: 4),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.nurse.imageUrl!),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              height: 72.0,
              width: 72,
            ),
          )),
      onTap: () {
        print('Pressed');
        Navigator.pushNamed(context, '/person_info',
            arguments: NurseDetailsArguments(
              widget.nurse,
              (widget.rated.isNotEmpty) ? widget.rated[0].rate.toString() : '0',
            ));
      },
    );
  }
}
// GestureDetector(
//       child: Card(
//         color: kBaseColor5,
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 4.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(nurse.imgpath),
//                     ),
//                     borderRadius: BorderRadius.all(Radius.circular(500))),
//                 height: 50.0,
//                 width: 70.0,
//               ),
//             ),
//             Text(nurse.rating),
//           ],
//         ),
//       ),
//       onTap: () {
//         print('Pressed');
//         Navigator.pushNamed(context, '/nurse_info',
//             arguments: NurseDetailsArguments(nurse: nurse));
//       },
//     )