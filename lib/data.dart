// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constant.dart';
import 'models/nurse.dart';
import 'models/states.dart';

class Data extends ChangeNotifier {
  String mainTitle = 'صفحه\bاصلی';
  List<Nurse> allNurse = Nurses;
}

List<Nurse> Nurses = [
  Nurse(
    name: 'مهسا میرزاخانی',
    family: '',
    docPath: '',
    username: '',
    gender: Gender.female,
    email: 'miladpython@gmail.com',
    phone: "09123456578",
    state: 0,
    age: 27,
    city: "زنجان",
    workConditions:
        "کار سخت وقت گیری نیست (محصول گذاشتن وردپرس ،رفع خطاها از جمله هاست افزونه قالب ، ویرایش قیمت و و انواع ویژگی های محصول ،طراحی بنر برای سایت در ایام خاص بلک فریدی ماه رمضان و ..... ، و تولید محتوا اینستا گرام  پست اینستاگرام و استوری موشن و...... )یعنی به یه نفر که گرافیک و وردپرسش عالی باشه بصورت دور کار با بیوگرافی نمونه کار کامل میخوام از نظر هزینه برای هریک از اینا باهم توافق میکنیم ",
    xpYEar: 5,
    rating: "8/75",
    imgpath: "assets/image/person.jpg",
  ),
  Nurse(
      name: 'مهتاب علیزاده',
      docPath: '',
      username: '',
      gender: Gender.female,
      email: 'miladpython@gmail.com',
      phone: "09123456578",
      state: 0,
      age: 25,
      city: "تهران",
      family: '',
      workConditions:
          "کار سخت وقت گیری نیست (محصول گذاشتن وردپرس ،رفع خطاها از جمله هاست افزونه قالب ، ویرایش قیمت و و انواع ویژگی های محصول ،طراحی بنر برای سایت در ایام خاص بلک فریدی ماه رمضان و ..... ، و تولید محتوا اینستا گرام  پست اینستاگرام و استوری موشن و...... )یعنی به یه نفر که گرافیک و وردپرسش عالی باشه بصورت دور کار با بیوگرافی نمونه کار کامل میخوام از نظر هزینه برای هریک از اینا باهم توافق میکنیم ",
      xpYEar: 5,
      rating: "8/75",
      imgpath: "assets/image/person2.jpg"),
  Nurse(
    name: 'امیر امینی',
    docPath: '',
    username: '',
    gender: Gender.female,
    email: 'miladpython@gmail.com',
    phone: "09123456578",
    state: 0,
    family: '',
    age: 35,
    city: "مشهد",
    workConditions:
        "کار سخت وقت گیری نیست (محصول گذاشتن وردپرس ،رفع خطاها از جمله هاست افزونه قالب ، ویرایش قیمت و و انواع ویژگی های محصول ،طراحی بنر برای سایت در ایام خاص بلک فریدی ماه رمضان و ..... ، و تولید محتوا اینستا گرام  پست اینستاگرام و استوری موشن و...... )یعنی به یه نفر که گرافیک و وردپرسش عالی باشه بصورت دور کار با بیوگرافی نمونه کار کامل میخوام از نظر هزینه برای هریک از اینا باهم توافق میکنیم ",
    xpYEar: 5,
    rating: "8/75",
    imgpath: "assets/image/person.jpg",
  ),
  Nurse(
    name: 'نگین احمدی',
    family: '',
    docPath: '',
    username: '',
    gender: Gender.female,
    phone: "09123456578",
    state: 0,
    age: 27,
    email: 'miladpython@gmail.com',
    city: "کرج",
    workConditions:
        "کار سخت وقت گیری نیست (محصول گذاشتن وردپرس ،رفع خطاها از جمله هاست افزونه قالب ، ویرایش قیمت و و انواع ویژگی های محصول ،طراحی بنر برای سایت در ایام خاص بلک فریدی ماه رمضان و ..... ، و تولید محتوا اینستا گرام  پست اینستاگرام و استوری موشن و...... )یعنی به یه نفر که گرافیک و وردپرسش عالی باشه بصورت دور کار با بیوگرافی نمونه کار کامل میخوام از نظر هزینه برای هریک از اینا باهم توافق میکنیم ",
    xpYEar: 4,
    rating: "8/75",
    imgpath: "assets/image/person.jpg",
  ),
  Nurse(
      name: 'مبینا امینی',
      family: '',
      docPath: '',
      username: '',
      gender: Gender.female,
      email: 'miladpython@gmail.com',
      phone: '09123456578',
      state: 0,
      age: 39,
      city: "بندرعباس",
      workConditions:
          "کار سخت وقت گیری نیست (محصول گذاشتن وردپرس ،رفع خطاها از جمله هاست افزونه قالب ، ویرایش قیمت و و انواع ویژگی های محصول ،طراحی بنر برای سایت در ایام خاص بلک فریدی ماه رمضان و ..... ، و تولید محتوا اینستا گرام  پست اینستاگرام و استوری موشن و...... )یعنی به یه نفر که گرافیک و وردپرسش عالی باشه بصورت دور کار با بیوگرافی نمونه کار کامل میخوام از نظر هزینه برای هریک از اینا باهم توافق میکنیم ",
      xpYEar: 3,
      rating: '8/75',
      imgpath: "assets/image/person2.jpg"),
];
List<StateList> states = [
  StateList("آذربایجان شرقی", '1'),
  StateList("آذربایجان غربی", '2'),
  StateList("اردبیل", '3'),
  StateList("اصفهان", '4'),
  StateList("البرز", '5'),
  StateList("ایلام", '6'),
  StateList("بوشهر", '7'),
  StateList("تهران", '8'),
  StateList("چهارمحال و بختیاری", '9'),
  StateList("خراسان جنوبی", '10'),
  StateList("خراسان رضوی", '11'),
  StateList("خراسان شمالی", '12'),
  StateList("خوزستان", '13'),
  StateList("زنجان", '14'),
  StateList("سمنان", '15'),
  StateList("سیستان و بلوچستان", '16'),
  StateList("فارس", '17'),
  StateList("قزوین", '18'),
  StateList("قم", '19'),
  StateList("کردستان", '20'),
  StateList("کرمان", '21'),
  StateList("کرمانشاه", '22'),
  StateList("کهگیلویه و بویراحمد", '23'),
  StateList("گلستان", '24'),
  StateList("لرستان", '25'),
  StateList("گیلان", '26'),
  StateList("مازندران", '27'),
  StateList("مرکزی", '28'),
  StateList("هرمزگان", '29'),
  StateList("همدان", '30'),
  StateList("یزد", '31'),
];
