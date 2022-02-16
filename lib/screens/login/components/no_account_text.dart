import 'package:nurse/constant.dart';
import 'package:flutter/material.dart';

import '../../signup/signup_popup.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'برای ثبت نام کلیک کنید',
          // "حساب ندارید؟ برای ایجاد حساب کلیک کنید!",

          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: const Text(
            "ثبت نام",
            style: TextStyle(fontSize: 16, color: kBaseColor2),
          ),
        ),
      ],
    );
  }
}
