import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_helper.dart';
import '../../../constant.dart';
import '../../../data.dart';
import '../../../net/network.dart';
import '../../../net/nurse_model.dart';
import '../../../net/welcome_screen.dart';
import '../../main_screen/main_screen.dart';
import '../../nurse_signPage/nurse_signPage.dart';
//import 'profile_pic.dart';

class EditProfileScreen extends StatefulWidget {
  static String routeName = "/editProfile";
  static int useriId = 0;
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

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showSpinner = false;
  bool isActive = false;
  int? id;
  String? avatarUrl;

  bool enableFAB = false;
  bool isCheckedMan = true;
  bool isCheckedfemale = false;
  String Age = '0';
  String xpYear = '0';

  // The _onBackPressed is for back to HomeScreen and refresh it by press Android backButton.
  /* Future<bool?> onBackPressed() async {
    Navigator.pushNamedAndRemoveUntil(
        context, ProfileScreen.routeName, (_) => false);
    return true;
  }
*/
  genderCheck() {
    if (WelcomeScreen.filterdNurses[0] == "M")
      isCheckedMan = true;
    else
      isCheckedMan = false;

    if (WelcomeScreen.filterdNurses[0] == "F")
      isCheckedfemale = true;
    else
      isCheckedfemale = false;
  }

  nursefilterSet() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print('${_prefs.getInt('id')}');

    WelcomeScreen.filterdNurses = await WelcomeScreen.nurseList
        .where((element) => element.userId == _prefs.getInt('id'))
        .toList();
    setState(() {});
    return WelcomeScreen.filterdNurses;
  }

  @override
  void initState() {
    super.initState();
    nursefilterSet();
    genderCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            iconSize: 40.0,
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/main_screen',
                  arguments: HomeArg(
                      WelcomeScreen.isLogedin, WelcomeScreen.hasAds, true));
            }),
        toolbarHeight: 60,
        title: const Text("ویرایش اطلاعات",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontFamily: 'iransans')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(
              isEditAble: isActive,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    nameField(
                        WelcomeScreen.filterdNurses[0].firstName, isActive),
                    const SizedBox(
                      width: 4,
                    ),
                    familyField(
                        WelcomeScreen.filterdNurses[0].lastName, isActive),
                  ],
                ),
                emailField(WelcomeScreen.filterdNurses[0].email, isActive),
                Row(
                  children: [
                    phoneFiled(
                        WelcomeScreen.filterdNurses[0].phoneNumber, isActive),
                    //gender man
                    Container(
                      margin: const EdgeInsets.only(right: 5, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        //border: Border.all(width: 2, color: kBaseColor2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'مرد',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'iransans',
                                    color: kBaseColor2),
                              ),
                              Theme(
                                child: Checkbox(
                                  value: isCheckedMan,
                                  activeColor: kBaseColor2,
                                  onChanged: isActive
                                      ? (value) {
                                          isCheckedfemale == true
                                              ? isCheckedfemale = false
                                              : isCheckedfemale = false;
                                          setState(() {
                                            isCheckedMan = value!;
                                          });
                                          isCheckedfemale
                                              ? EditProfileScreen.gender = 'F'
                                              : EditProfileScreen.gender = 'M';
                                        }
                                      : null,
                                ),
                                data: ThemeData(
                                  //primarySwatch: Colors.blue,
                                  unselectedWidgetColor:
                                      kBaseColor2, // Your color
                                ),
                              ),
                              //Checkbox
                            ], //<Widget>[]
                          ), //Row
                          //gender women
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text(
                                'زن',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'iransans',
                                    color: kBaseColor2),
                              ),
                              Theme(
                                child: Checkbox(
                                  value: isCheckedfemale,
                                  activeColor: kBaseColor2,
                                  onChanged: isActive
                                      ? (value) {
                                          isCheckedMan == true
                                              ? isCheckedMan = false
                                              : isCheckedMan = false;
                                          setState(() {
                                            isCheckedfemale = value!;
                                          });
                                          isCheckedMan
                                              ? EditProfileScreen.gender = 'M'
                                              : EditProfileScreen.gender = 'F';
                                        }
                                      : null,
                                ),
                                data: ThemeData(
                                  //   primarySwatch: Colors.blue,
                                  unselectedWidgetColor:
                                      kBaseColor2, // Your color
                                ),
                              ), //Checkbox
                            ], //<Widget>[]
                          ), //Row
                        ],
                      ),
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  StateSelector(context),
                  const SizedBox(
                    width: 4,
                  ),
                  cityFiled(WelcomeScreen.filterdNurses[0].city, isActive)
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeField(WelcomeScreen.filterdNurses[0].age.toString(),
                        isActive),
                    const SizedBox(
                      width: 4,
                    ),
                    xpYears(
                        WelcomeScreen.filterdNurses[0].workExperience
                            .toString(),
                        isActive),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                addressField(
                    WelcomeScreen.filterdNurses[0].workCondition, isActive),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: DefaultButton(
                      color: isActive ? Colors.green : kBaseColor2,
                      text: isActive ? "ذخیره" : "ویرایش",
                      press: () {
                        if (isActive == false) {
                          Network().netUpdate(
                              id: WelcomeScreen.filterdNurses[0].id!,
                              firstname: EditProfileScreen.firstName,
                              lastname: EditProfileScreen.lastName,
                              gender: EditProfileScreen.gender,
                              city: EditProfileScreen.cIty,
                              state: EditProfileScreen.state,
                              workCond: EditProfileScreen.woRkCondition,
                              age: EditProfileScreen.age,
                              phoneNumber: EditProfileScreen.phoneNumber);
                          Navigator.pushNamedAndRemoveUntil(
                              context, MainScreen.routeName, (route) => false,
                              arguments: HomeArg(WelcomeScreen.isLogedin,
                                  WelcomeScreen.hasAds, false));
                        }
                        setState(() {
                          isActive = !isActive;
                        });
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

//select state
  Padding StateSelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: GestureDetector(
        onTap: () {
          isActive
              ? setState(() {
                  enableFAB = true;
                })
              : Null;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const StetesListProvider();
              });
        },
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            //border: Border.all(width: 2, color: kBaseColor2),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 10, right: 10),
                        child: Text(
                          states[int.parse(
                                  WelcomeScreen.filterdNurses[0].state!)]
                              .stateName,
                          style: TextStyle(
                              color: isActive
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.7),
                              fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 13,
                          color: isActive
                              ? Colors.black.withOpacity(0.5)
                              : Colors.grey.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color:
                        isActive ? kBaseColor2 : Colors.grey.withOpacity(0.4),
                    thickness: 1,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

///////////////////////
//fields start/////////
//////////////////////

  Container nameField(String? name, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: name,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => name = newValue,
        onChanged: (value) {
          EditProfileScreen.firstName = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "نام",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " نام",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Container familyField(String? family, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: family,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => family = newValue,
        onChanged: (value) {
          EditProfileScreen.firstName = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "نام خانوادگی",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " فامیلی",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Container emailField(String? email2, bool? isWriteAble) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: email2,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email2 = newValue,
        onChanged: (value) {
          EditProfileScreen.email = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "ایمیل",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " ایمیل",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/Mail.svg"),
        ),
      ),
    );
  }

  Container phoneFiled(String? phone2, bool? isWriteAble) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.only(right: 19, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: phone2,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => phone2 = newValue,
        onChanged: (value) {
          EditProfileScreen.phoneNumber = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "شماره تماس",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: "  شماره موبایل",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/Phone.svg"),
        ),
      ),
    );
  }

  Container cityFiled(String? city2, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: city2,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => city2 = newValue,
        onChanged: (value) {
          EditProfileScreen.cIty = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "شهر",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " شهر",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Container stateField(String? state2, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: state2,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => state2 = newValue,
        onChanged: (value) {
          EditProfileScreen.state = value;
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "استان",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " استان",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Container addressField(String? address2, bool? isWriteAble) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: address2,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => address2 = newValue,
        onChanged: (value) {
          EditProfileScreen.woRkCondition = value;
        },
        validator: (value) {},
        minLines: 3,
        maxLines: 3,
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: "اطلاعات و شرایط پرستار",
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: " شرایط و خدمات",
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/receipt.svg"),
        ),
      ),
    );
  }

  Container AgeField(String? name, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: name,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => name = newValue,
        onChanged: (value) {
          EditProfileScreen.age = int.parse(value);
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: 'سال تولد',
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: 'سال تولد',
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/Gift Icon.svg"),
        ),
      ),
    );
  }

  Container xpYears(String? xpYear, bool? isWriteAble) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        initialValue: xpYear,
        enabled: isWriteAble,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => xpYear = newValue,
        onChanged: (value) {
          EditProfileScreen.workExperience = int.parse(value);
        },
        validator: (value) {},
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBaseColor2)),
          labelText: 'تجربه کاری',
          labelStyle: TextStyle(color: kBaseColor2),
          hintText: 'تجربه کاری به سال',
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
              color: kBaseColor2, svgIcon: "assets/icons/Plus Icon.svg"),
        ),
      ),
    );
  }
}
