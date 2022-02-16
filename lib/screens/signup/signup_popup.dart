import 'package:flutter/material.dart';

import '../../components/custom_surfix_icon.dart';
import '../../components/default_button.dart';
import '../../components/form_error.dart';
import '../../constant.dart';
import '../../net/network.dart';
import '../nurse_signPage/nurse_signPage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? userName;
  String? password;
  String? conform_password;
  bool remember = false;
  bool showSpinner = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showSpinner == true ? false : true,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08), // 4%
                  Text(
                    "ثبت نام",
                    style: TextStyle(
                        fontFamily: "Iransans",
                        //123456
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "جهت ثبت نام اطلاعات زیر را تکمیل کرده و ثبت نام کنید!",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildEmailFormField(),
                        SizedBox(height: 30),
                        buildUsernameFormField(),
                        SizedBox(height: 30),
                        buildPasswordFormField(),
                        SizedBox(height: 30),
                        buildConformPassFormField(),
                        FormError(errors: errors),
                        SizedBox(height: 40),
                        DefaultButton(
                          text: "ثبت نام",
                          press: () async {
                            // if all are valid then go to success screen and then go to home screen
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // Creates a new Woocommerce customer and returns the WooCustomer object.
                              try {
                                setState(() {
                                  showSpinner = true;
                                });
                                Network()
                                    .creatUser(email!, userName!, password!);
                                setState(() {
                                  showSpinner = false;
                                });
                                kShowToast(
                                    context, 'ثبت نام با موفقیت انجام شد');

                                Navigator.pushNamedAndRemoveUntil(context,
                                    NurseSignUp.routeName, (route) => false);
                              } catch (e) {
                                setState(() {
                                  showSpinner = false;
                                });
                                kShowToast(context,
                                    'خطا در ثبت نام : \n هنگام ثبت نام کردن مشکلی به وجود آمده است ');

                                print(e);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  /* Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocalCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),*/
                  SizedBox(height: 20),
                  Text(
                    'ثبت نام شما به منزله ی  \تایید قوانین فروشگاه آلفا میباشد',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "تایید رمز عبور",
        hintText: "دوباره رمز را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "رمز عبور",
        hintText: "رمز خود را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kUsernameNullError);
        } else if (value.length >= 3) {
          removeError(error: kShortUserNameError);
        }
        return null;
      },
      validator: (value) {
        userName = value;
        if (value!.isEmpty) {
          addError(error: kUsernameNullError);
          return "";
        } else if (value.length < 3) {
          addError(error: kShortUserNameError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "نام کاربری",
        hintText: "نام کاربری را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ایمیل",
        hintText: "ایمیل خود را وارد کنید",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
