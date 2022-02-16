// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant.dart';
import '../../../net/nurse_model.dart';
import '../../../net/rate_model.dart';
import '../../../net/welcome_screen.dart';
import '../../nurseInfo/person_info_screen.dart';

class PersonCard extends StatefulWidget {
  final Nurse nurse;
  PersonCard({
    required this.nurse,
    Key? key,
  }) : super(key: key);
  List<Rate> rated = [];
  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  setRate() {
    widget.rated = WelcomeScreen.Rates.where(
        (element) => element.userId == widget.nurse.userId).toList();
    setState(() {});
  }

  double widthcontext = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setRate();
  }

  @override
  Widget build(BuildContext context) {
    widthcontext = MediaQuery.of(context).size.width * 0.4;
    // String defualtImageUrl ='https://epic1729.pythonanywhere.com/media/postImage/default.png';
    return GestureDetector(
      child: Container(
          height: 260,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: const BoxDecoration(
              color: kBaseColor1,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (widget.nurse.imageUrl != null)
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.nurse.imageUrl!),
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(500),
                          topRight: Radius.circular(500),
                          bottomLeft: Radius.circular(1000),
                          bottomRight: Radius.circular(1000),
                        )),
                  ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  ' ${widget.nurse.firstName} ${widget.nurse.lastName}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, bottom: 4),
                  child: Text(
                    'سابقه کار :${widget.nurse.workExperience} سال'
                    '',
                    style: TextStyle(
                        fontFamily: 'iransans',
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Center(
                    child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: (widget.rated.isNotEmpty)
                      ? double.parse(widget.nurse.rate.toString())
                      : 0,
                  //initialRating: 3,
                  ignoreGestures: true,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, x) => const Icon(
                    Icons.star,
                    size: 22,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )),
              ],
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
