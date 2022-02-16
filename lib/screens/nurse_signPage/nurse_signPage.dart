import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/form_helper.dart';
import '../../constant.dart';
import '../../data.dart';
import '../../net/network.dart';
import '../../net/welcome_screen.dart';
import '../main_screen/main_screen.dart';

class NurseSignUp extends StatefulWidget {
  NurseSignUp({Key? key}) : super(key: key);
  static String routeName = '/NurseSignUp';

  static int useriId = 0;
  static File? image;
  static String firstName = '';
  static String lastName = '';
  static int age = 18;
  static String gender = 'M';
  static String email = '';
  static String phoneNumber = '';
  static String imageUrl = '';
  static String state = '';
  static String cIty = '';
  static int workExperience = 0;
  static String woRkCondition = '';
  @override
  _NurseSignUpState createState() => _NurseSignUpState();
}

class _NurseSignUpState extends State<NurseSignUp> {
  void getUserId() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    NurseSignUp.useriId = _prefs.getInt('id') ?? 0;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  bool isCheckedMan = false;
  bool isCheckedfemale = false;
  // ignore: non_constant_identifier_names
  Color CardColor = Colors.white;
  bool enableFAB = false;
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*  floatingActionButton: FloatingActionButton.extended(
          extendedPadding: const EdgeInsets.only(right: 5, left: 10),
          onPressed: () {},
          label: Row(
            children: const [
              Icon(
                Icons.add,
                size: 20,
              ),
              Text(
                'مدارک',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'iransans',
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),*/
        backgroundColor: kBaseColor0,
        bottomNavigationBar: Container(
          height: 60,
          color: kBaseColor1,
          child: Center(
            child: SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width * 0.39,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(70, 0),
                  primary: kBaseColor4,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {
                  Network().netCreate(
                      NurseSignUp.useriId,
                      NurseSignUp.firstName,
                      NurseSignUp.lastName,
                      NurseSignUp.gender,
                      NurseSignUp.age,
                      NurseSignUp.email,
                      NurseSignUp.phoneNumber,
                      NurseSignUp.state,
                      NurseSignUp.cIty,
                      NurseSignUp.workExperience,
                      NurseSignUp.woRkCondition);
                  Navigator.pushNamed(context, MainScreen.routeName,
                      arguments: HomeArg(
                          WelcomeScreen.isLogedin, WelcomeScreen.hasAds, true));
                },
                child: const Text(
                  'ارسال آگهی',
                  style: TextStyle(fontSize: 12, fontFamily: 'IranSans'),
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
              //  fit: StackFit.expand,
              //alignment: Alignment.center,
              children: [
                //top banner container
                TopBannerTitle(context),
                //body + avatar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.65,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          color: kBaseColor1,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ProfilePic(
                                  isEditAble: true,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      nameField(true, 'نام', context),
                                      familyField(true, 'فامیلی', context)
                                    ],
                                  ),
                                  //email field
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10),
                                    child: emailField(true, 'ایمیل', context),
                                  ),
                                  //phone field and genders
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        //phone number
                                        phone(true, 'شماره تماس', context),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        //gender man
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            const Text(
                                              'مرد',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'iransans',
                                                  color: Colors.black),
                                            ),
                                            Checkbox(
                                              value: isCheckedMan,
                                              onChanged: (value) {
                                                isCheckedfemale == true
                                                    ? (isCheckedfemale = false)
                                                    : isCheckedfemale = false;

                                                setState(() {
                                                  isCheckedMan = value!;
                                                });
                                                isCheckedfemale
                                                    ? NurseSignUp.gender = 'F'
                                                    : NurseSignUp.gender = 'M';
                                              },
                                            ), //Checkbox
                                          ], //<Widget>[]
                                        ), //Row
                                        //gender women
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            const Text(
                                              'زن',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'iransans',
                                                  color: Colors.black),
                                            ),
                                            Checkbox(
                                              value: isCheckedfemale,
                                              onChanged: (value) {
                                                isCheckedMan == true
                                                    ? isCheckedMan = false
                                                    : isCheckedMan = false;
                                                setState(() {
                                                  isCheckedfemale = value!;
                                                });
                                                isCheckedMan
                                                    ? NurseSignUp.gender = 'M'
                                                    : NurseSignUp.gender = 'F';
                                              },
                                            ), //Checkbox
                                          ], //<Widget>[]
                                        ), //Row
                                      ],
                                    ),
                                  ),
                                  //state and city
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //state
                                      StateSelector(context),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: city(true, 'شهر', context),
                                      ),
                                    ],
                                  ),
                                  //age and xpyear
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ageField(true, 'سال تولد', context),
                                        xpyearField(true, 'تجربه(سال)', context)
                                      ],
                                    ),
                                  ),

                                  //nurse work condition and experience
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: workCondition(
                                        true, 'شرایط کار پرستار', context),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    /* Positioned(
                      top: MediaQuery.of(context).size.height * 0.3 - 90 / 0.8,
                      child: ProfilePic(
                        isEditAble: true,
                      ),
                    ),*/
                  ],
                )
              ]),
        ),
      ),
    );
  }

//top banner and all stacks on it
  Stack TopBannerTitle(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/baner.jpg'),
                  fit: BoxFit.fill),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            )),
        //header back arrow icon and title
        Positioned(
            top: 3,
            right: 2,
            child: Row(
              children: [
                IconButton(
                    onPressed: () async {
                      bool hasAds = false;
                      /*List<Nurse> nurse = WelcomeScreen.nurseList
                          .where((element) => element.id == '10')
                          .toList();
                      if (nurse[0].firstName == null ||
                          nurse[0].firstName == '')
                        hasAds = false;
                      else
                        hasAds = true;*/

                      Navigator.pushNamedAndRemoveUntil(context,
                          MainScreen.routeName, (Route<dynamic> route) => false,
                          arguments: HomeArg(WelcomeScreen.isLogedin,
                              WelcomeScreen.hasAds, false));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.black,
                    )),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'فرم ایجاد آگهی پرستار',
                  style: TextStyle(
                      fontFamily: 'iransans',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            )),
        //bnner sentence
        Positioned(
          top: 59,
          right: 55,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
                color: kBaseColor0.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15)),
            child: const Text(
              'برای بازخورد بهتر و ارتباط والدین با شما\n           تمامی فرم ها را پر کنید!',
              style: TextStyle(
                  fontFamily: 'iransans',
                  fontSize: 18,
                  color: kBaseColor4,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

//chosing state builder
  Padding StateSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            enableFAB = true;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const StetesListProvider();
              });
        },
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 2, color: kBaseColor2)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'استان',
                    style: TextStyle(
                        fontFamily: 'iransans',
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//chosing state pop up
class StetesListProvider extends StatefulWidget {
  const StetesListProvider({Key? key}) : super(key: key);

  @override
  _StetesListProviderState createState() => _StetesListProviderState();
}

class _StetesListProviderState extends State<StetesListProvider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      padding: const EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Expanded(
        child: Stack(children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    'میتوانید بیش از یک استان انتخاب کنید',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'iransans',
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  ...List.generate(
                      states.length,
                      (index) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: GestureDetector(
                              onTap: () {
                                print('taped');
                                setState(() {
                                  states[index].isSelected == false
                                      ? states[index].isSelected = true
                                      : states[index].isSelected = false;
                                  NurseSignUp.state = index.toString();
                                });
                              },
                              child: Card(
                                color: states[index].isSelected
                                    ? Colors.red[100]
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    states[index].stateName.toString(),
                                    style: const TextStyle(fontSize: 22.0),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ]),
              ),
            )
          ]),
          Positioned(
            bottom: 5,
            left: 15,
            child: FloatingActionButton.extended(
              label: const Text(
                'تایید',
                style: TextStyle(
                    fontFamily: 'iransans', fontSize: 17, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ]),
      ),
    );
  }
}

//document upload class

class DocUpload extends StatelessWidget {
  const DocUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: const Color(0xFF797979), //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: const Center(
            child: Text("This is a modal sheet"),
          )),
    );
  }
}
