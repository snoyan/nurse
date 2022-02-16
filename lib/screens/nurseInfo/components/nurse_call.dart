import 'package:flutter/material.dart ';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../constant.dart';
import '../../../net/nurse_model.dart';

class NurseCall extends StatelessWidget {
  Nurse nurse;
  NurseCall({Key? key, required this.nurse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: const Color(0xFF797979), //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          decoration: const BoxDecoration(
              color: kBaseColor1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اطلاعات تماس',
                  style: TextStyle(
                    fontFamily: 'iransans',
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Divider(),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kBaseColor2,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'تماس با ${nurse.phoneNumber}',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'iransans',
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    launch("tel://${nurse.phoneNumber}");
                  },
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email,
                          color: kBaseColor2,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ' ایمیل ${nurse.email}',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'iransans',
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: "${nurse.email}"));
                    print('copy to Clipboard');
                  },
                )
              ],
            ),
          )),
    );
  }
}
