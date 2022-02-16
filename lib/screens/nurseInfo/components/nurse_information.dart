import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../person_info_screen.dart';

class NurseInformation extends StatelessWidget {
  const NurseInformation({
    Key? key,
    required this.agrs,
  }) : super(key: key);

  final NurseDetailsArguments agrs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: kBaseColor2,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: ListView(
        children: [
          //btns madarek and  etelaat
          /** Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(70, 0),
                    primary: kCardColor,
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
              //isScrollControlled: true,
              
              context: context,
              builder:(context) => NurseDocument(),
              shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15.0),
  ),
              );},
                  child: Text(
                    'دیدن مدارک',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'IranSans'),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(70, 0),
                    primary: kBtnColor,
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Text(
                    'اطلاعات تماس',
                    style: TextStyle(
                        fontSize: 12, fontFamily: 'IranSans'),
                  ),
                ),
              ),
            ],
          ),
          */ //
          const SizedBox(
            height: 5,
          ),
          //name and rete row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "نام:  ${agrs.nurse.firstName} ${agrs.nurse.lastName}",
                style: const TextStyle(
                    fontFamily: "IranSans", color: Colors.white),
              ),
              Text(
                "سابقه کار: ${agrs.nurse.workExperience} سال",
                style: const TextStyle(
                    fontFamily: "IranSans", color: Colors.white),
              ),
            ],
          ),

          Divider(
            height: 5,
            color: Colors.grey.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "سن: ${agrs.nurse.age}",
                style: const TextStyle(
                    fontFamily: "IranSans", color: Colors.white),
              ),
            ],
          ),
          Divider(
            height: 5,
            color: Colors.grey.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "شهرستان: ${agrs.nurse.city}",
                style: const TextStyle(
                    fontFamily: "IranSans", color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
