import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../constant.dart';
import '../screens/nurse_signPage/nurse_signPage.dart';

//age value
int val = 0;
int xpyearVal = 0;
//String name  fields
Container nameField(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.45,
    child: TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.firstName = value;
      },
    ),
  );
}

//family filed
Container familyField(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.45,
    child: TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.lastName = value;
      },
    ),
  );
}

Container emailField(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
    padding: const EdgeInsets.symmetric(
        //  vertical: 40.0,
        //  horizontal: 20,
        ),
    child: TextFormField(
      validator: EmailValidator(errorText: 'enter a valid email address'),
      decoration: InputDecoration(
          /* icon: SvgPicture.asset(
            'assets/icons/User.svg',
            height: 18,
            color: kBaseColor3,
          ),*/
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.email = value;
      },
    ),
  );
}

//age field
Container ageField(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.45,
    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),

    child: TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle:
              const TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        NurseSignUp.age = int.parse(value);
        if (val <= 60 || val >= 15) {
          print('سال بین 1350 الی 1380 باید باشد!');
        }
      },
      onSaved: (value) {},
    ),
  );
}

Container city(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.45,
    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
    padding: const EdgeInsets.symmetric(
        //  vertical: 40.0,
        //  horizontal: 20,
        ),
    child: TextFormField(
      decoration: InputDecoration(
          /* icon: SvgPicture.asset(
            'assets/icons/User.svg',
            height: 18,
            color: kBaseColor3,
          ),*/
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.cIty = value;
      },
    ),
  );
}

Container phone(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.58,
    child: TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.phoneNumber = value;
      },
    ),
  );
}

Container gender(String title, bool value, VoidCallback changeState(value)) {
  return Container(
    child: Row(
      children: <Widget>[
        const SizedBox(
          width: 10,
        ), //SizedBox
        Text(
          title,
          style: const TextStyle(
              fontSize: 17.0, fontFamily: 'iransans', color: Colors.black),
        ),
        const SizedBox(width: 10), //SizedBox
        /** Checkbox Widget **/
        Checkbox(
          value: value,
          onChanged: (value) {
            changeState(value);
          },
        ), //Checkbox
      ], //<Widget>[]
    ), //Row
  );
}

Container workCondition(bool? isWriteAble, String label, BuildContext context) {
  return Container(
    height: 120,
    width: MediaQuery.of(context).size.width,
    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),
    padding: const EdgeInsets.symmetric(
        //  vertical: 40.0,
        //  horizontal: 20,
        ),
    child: TextFormField(
      maxLines: 7,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      onChanged: (value) {
        NurseSignUp.woRkCondition = value;
      },
    ),
  );
}

//years pf working experience
Container xpyearField(
  bool? isWriteAble,
  String label,
  BuildContext context,
) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width * 0.45,
    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(60)),

    child: TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: kBaseColor2,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: kBaseColor2,
              width: 2.0,
            ),
          ),
          labelText: label,
          labelStyle:
              const TextStyle(color: Colors.black, fontFamily: 'iransans'),
          hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.5), fontFamily: 'iransans')),
      cursorColor: kBaseColor2,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        NurseSignUp.workExperience = int.parse(value);
        if (xpyearVal <= 0 || val >= 50) {
          print('عدد مابین 0 و 50 باید باشد!');
        }
      },
      onSaved: (value) {},
    ),
  );
}

//profile image box
class ProfilePic extends StatefulWidget {
  bool isEditAble;
  ProfilePic({
    required this.isEditAble,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    final File? file = File(image!.path);
    File imageFile = new File(image.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    print('//////////////////////////');
    print(base64Image.toString());
    print('//////////////////////////');

    setState(() {
      NurseSignUp.image = file;
      _image = file;
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    final File? file = File(image!.path);
    setState(() {
      NurseSignUp.image = file;
      _image = file;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  // Upload(File imageFile) async {
  //   var stream =
  //       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //   var length = await imageFile.length();

  //   var uri = Uri.parse(uploadURL);

  //   var request = new http.MultipartRequest("POST", uri);
  //   var multipartFile = new http.MultipartFile('file', stream, length,
  //       filename: basename(imageFile.path));
  //   //contentType: new MediaType('image', 'png'));

  //   request.files.add(multipartFile);
  //   var response = await request.send();
  //   print(response.statusCode);
  //   response.stream.transform(utf8.decoder).listen((value) {
  //     print(value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98,
      width: 98,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image as File,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

// CircleAvatar(
//             backgroundImage: AssetImage("assets/image/Profile-Image.png"),
//           ),
//           if (widget.isEditAble) editPic()
  Positioned editPic() {
    return Positioned(
      left: -16,
      bottom: 0,
      child: SizedBox(
        height: 46,
        width: 46,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white),
            ),
            primary: Colors.white,
            backgroundColor: Color(0xFFF5F6F9),
          ),
          onPressed: () {},
          child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
        ),
      ),
    );
  }
}
