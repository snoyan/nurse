import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color kBaseColor0 = Color(0xFFF5F6F9);

///white
const Color kBaseColor1 = Color(0xFFFFE6E6);

///white
const Color kBaseColor2 = Color(0xfff7b4dd);

///Veri Peri
const Color kBaseColor3 = Color(0xff97999b);

///Ultimate Gray
const Color kBaseColor4 = Color(0xff104581);

///Classic Blueconst
const Color kBaseColor5 = Color(0xFFAA95FA);

///

enum Gender { female, male }

void kShowToast(BuildContext context, String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp numberValidatetor =
    RegExp(r'09(1[0-9]|3[1-9]|2[1-9])-?[0-9]{3}-?[0-9]{4}');
const String kEmailNullError = "لطفا ایمیل خود را وارد کنید";
const String kInvalidEmailError = "ایمیل وارد شده نا معتبر است!";
const String kPassNullError = "رمز عبور خود را وارد کنید";
const String kShortPassError = "رمز وارد شده کوتاه است";
const String kMatchPassError = "رمز وارد شده همخوانی ندارد";
const String kUsernameNullError = "نام کاربری خود را وارد کنید";
const String kShortUserNameError =
    "نام کاربری وارد شده نباید کمتر از سه حرف باشد";
const String kNameNullError = "نام خود را وارد کنید";
const String kPhoneNumberNullError = "شماره تماس خود را وارد کنید";
const String kAddressNullError = "آدرس خود را وارد کنید";

Map<int, String> cityList = {
  1: 'آذربايجان شرقي',
  2: 'آذربايجان غربي',
  3: 'اردبيل',
  4: 'اصفهان',
  5: 'البرز',
  6: 'ايلام',
  7: 'بوشهر',
  8: 'تهران',
  9: 'چهارمحال و بختياري',
  10: 'خراسان جنوبي',
  11: 'خراسان رضوي',
  12: 'خراسان شمالي',
  13: 'خوزستان',
  14: 'زنجان',
  15: 'سمنان',
  16: 'سيستان و بلوچستان',
  17: 'فارس',
  18: 'قزوين',
  19: 'قم',
  20: 'كردستان',
  21: 'كرمان',
  22: 'كرمانشاه',
  23: 'كهگيلويه و بويراحمد',
  24: 'گلستان',
  25: 'گيلان',
  26: 'لرستان',
  27: 'مازندران',
  28: 'مركزي',
  29: 'هرمزگان',
  30: 'همدان',
  31: 'يزد',
};
