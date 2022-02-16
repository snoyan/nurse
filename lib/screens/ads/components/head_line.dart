import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../../../data.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) => Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 50.0, right: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                data.mainTitle,
                style: const TextStyle(color: Colors.white, fontSize: 20),
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
                    onPressed: () {
                      Navigator.pushNamed(context, "/search_screen");
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
      ),
    );
  }
}
