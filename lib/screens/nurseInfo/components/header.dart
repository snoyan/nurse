import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constant.dart';
import '../../../net/nurse_model.dart';

class Header extends StatelessWidget {
  const Header({required this.nurse, required this.rate, Key? key})
      : super(key: key);
  final Nurse nurse;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .289,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kBaseColor2,
      ),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: Hero(
              tag: nurse.firstName.toString(),
              child: Image(
                image: NetworkImage(
                  nurse.imageUrl!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: const BoxDecoration(),
              margin: const EdgeInsets.only(top: 8, left: 8),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 27,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.51,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    RatingBar.builder(
                      maxRating: 10,
                      itemSize: 25,
                      initialRating: nurse.rate == null
                          ? double.parse('0')
                          : double.parse(nurse.rate.toString()) >= 0
                              ? double.parse(nurse.rate.toString())
                              : double.parse('0'),
                      ignoreGestures: true,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, x) => const Icon(
                        Icons.star,
                        size: 22,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      nurse.rate.toString() == "null"
                          ? '0'
                          : nurse.rate.toString(),
                      style: const TextStyle(
                          color: Colors.amber,
                          fontFamily: 'iransans',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
