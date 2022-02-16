import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../net/nurse_model.dart';

class NurseDocument extends StatelessWidget {
  Nurse nurse;
  NurseDocument({Key? key, required this.nurse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 0.7,
      color: const Color(0xFF797979), //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          )),
    );
  }
}
