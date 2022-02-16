import 'package:flutter/material.dart';
import '../../../constant.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 5.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            const Divider(
              indent: 10,
              endIndent: 10,
              color: kBaseColor1,
            ),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18, color: Colors.white, fontFamily: 'iransans'),
            ),
          ],
        ),
      ),
    );
  }
}
