import '../constant.dart';

class Nurse {
  String name = ''; //
  String username = '';
  String family = ''; //
  String email = '';
  String imgpath = '';
  String rating = '';
  int age = 0;
  int state = 0; //
  String city = ''; //
  /// .this should be an image path
  var docPath = '';
  String phone = ''; //
  int xpYEar = 0;
  String workConditions = '';
  Gender gender = Gender.male; //
  Nurse(
      {required this.name,
      required this.username,
      required this.family,
      required this.email,
      required this.imgpath,
      required this.rating,
      required this.age,
      required this.state,
      required this.city,
      required this.docPath,
      required this.phone,
      required this.xpYEar,
      required this.workConditions,
      required this.gender});

  Nurse.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        family = json['family'],
        imgpath = json['imgpath'],
        age = json['age'],
        email = json['email'],
        state = json['state'],
        city = json['city'],
        docPath = json['docpath'],
        phone = json['phone'],
        xpYEar = json['xpYear'],
        workConditions = json['workCondition'],
        rating = json['rating'],
        gender = json['gender'];
}
