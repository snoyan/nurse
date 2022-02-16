// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';
import '../screens/ads/components/advertising.dart';
import '../screens/main_screen/main_screen.dart';
import 'endpints.dart';
import 'nurse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'rate_model.dart';
import 'welcome_screen.dart';

//save token taken from signup user
void upDateSharedPreferences(String token, int id) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('token', token);
  _prefs.setInt('id', id);
  // _prefs.setString('selectedState', selectedState);
}

class Network {
  List<Nurse> nurses = [];
  List<Rate> rates = [];

  /////////////post rate/////////////////
  createRate(int userId, int rate, String phoneNumber) async {
    var url = Uri.parse('https://epic1729.pythonanywhere.com/api/rate/create/');
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Authorization': apiKey,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'userId': userId,
            'rate': rate,
            'phoneNumber': phoneNumber
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('rate is created');
        return true;
      } else {
        return false;
        print('rate is not create');
      }
    } catch (exception) {
      print(exception);
    }
  }

  /////////////set nurse list by state//////
  stateNurseList() {
    Advertising.stateNurses = WelcomeScreen.nurseList
        .where(
            (element) => element.state == MainScreen.selectedState.toString())
        .toList();
    print('stateNurses length:' + '${Advertising.stateNurses.length}');
    if (Advertising.stateNurses.isEmpty)
      Advertising.stateNurses = WelcomeScreen.nurseList;
  }

//////////////////////get rates////////////////////////////
  Future<List<Rate>> getRate() async {
    var list = await netGet(e_get_rate);
    int t = 0;

    for (var i in list) {
      rates.add(Rate(
        id: list[t]['id'],
        userId: list[t]['userId'],
        phoneNumber: list[t]['phoneNumber'],
        rate: list[t]['rate'],
        created: list[t]['created'],
      ));
      t++;
    }
    int counter = 0;
    int sum = 0;
    for (Nurse nurse in WelcomeScreen.nurseList) {
      counter = 0;
      sum = 0;
      for (int i = 0; i < rates.length; i++) {
        if (nurse.userId == rates[i].userId) {
          sum += rates[i].rate!;
          rates.remove(rates[i]);
          counter++;
        }
      }
      if (sum > 0) {
        nurse.rate = (sum ~/ counter) as int?;
        print('//////////////////////////////');
        print("rate is ${nurse.rate}");
      }
    }
    await Future.delayed(Duration(seconds: 5));

    return rates;
  }
  //////////////////////// login request//////////////////////////

  loginToken(String username, String password) async {
    /* Map data = {
    'username': '$username'
  }*/
    final response = await http.post(
      Uri.parse('https://epic1729.pythonanywhere.com/api-token-auth/'),
      headers: <String, String>{
        'Authorization': apiKey,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> token = json.decode(response.body);
      await Network().getUser();
      List<User> filterdUsers = WelcomeScreen.users
          .where((element) => element.username == username)
          .toList();

      upDateSharedPreferences(
        token['token'],
        filterdUsers[0].id,
      );
      WelcomeScreen.isLogedin = true;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      List hasNurse = WelcomeScreen.nurseList
          .where((element) => element.userId == _prefs.getInt('id'))
          .toList();
      if (hasNurse.isNotEmpty)
        WelcomeScreen.hasAds = true;
      else
        WelcomeScreen.hasAds = false;
      //return true;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }

  ////////////////////// put request/////////////////////////
  void netUpdate({
    required int id,
    required String firstname,
    required String lastname,
    required String gender,
    required String city,
    required String state,
    required String workCond,
    required int age,
    required String phoneNumber,
  }) async {
    var url = Uri.parse(
      baseUrl + e_get_nurse_update + id.toString() + '/',
    );
    try {
      http.Response response = await http.put(
        url,
        headers: <String, String>{
          'Authorization': apiKey,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          // "model_pic": "https://epic1729.pythonanywhere.com/media/postImage/blockchain.jpg",
          "firstName": firstname,
          "lastName": lastname,
          "gender": gender,
          "age": age,
          "phoneNumber": phoneNumber,
          "state": state,
          "city": city,
          "workCondition": workCond,
        }),
      );
      if (response.statusCode == 200) {
        print('is changed');
      } else {
        print('is not changed');
      }
    } catch (exception) {
      print(exception);
    }
  }

//////////////create user//////////////////
  void creatUser(String email, String username, String password) async {
    var url = Uri.parse('https://epic1729.pythonanywhere.com/api/user/create/');
    try {
      final response = await http.post(url,
          headers: <String, String>{
            'Authorization': apiKey,
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'username': username,
            'email': email,
            'password': password
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        await loginToken(username, password);

        print('user is created');
      } else {
        print('user is not create');
      }
    } catch (exception) {
      print(exception);
    }
  }

////////////////////// create ads request/////////////////////////
  void netCreate(
      int useriId,
      String firstName,
      String lastName,
      String gender,
      int age,
      String email,
      String phoneNumber,
      String state,
      String city,
      int exp,
      String workConditions) async {
    var url = Uri.parse(
      baseUrl + e_create_nurse,
    );
    try {
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Authorization': apiKey,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          // "imageUrl": "https://epic1729.pythonanywhere.com/media/postImage/blockchain.jpg",
          "userId": useriId,
          "firstName": firstName,
          "lastName": lastName,
          "gender": gender,
          "age": age,
          "email": email,
          "phoneNumber": phoneNumber,
          "state": state,
          "city": city,
          "workCondition": workConditions,
        }),
      );
      if (response.statusCode >= 200 && response.statusCode < 305) {
        print('is created');
        WelcomeScreen.hasAds = true;
      } else {
        print('is not create');
      }
    } catch (exception) {
      print(exception);
    }
  }

  //////////////////////get user list//////////////////////
  Future<List<User>> getUser() async {
    var url = Uri.parse(baseUrl + e_get_user_list);

    try {
      http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Authorization': apiKey,
          'Content-Type': "application/json; charset=utf-8",
        },
      );
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        print(body);
        print('////////////////////////////////////////');

        print('is correct');
        var x = json.decode(utf8.decode(response.bodyBytes));
        // var x = json.decode(response.body);
        int t = 0;
        for (var i in x) {
          WelcomeScreen.users.add(User(
              id: x[t]['id'],
              email: x[t]['email'].toString(),
              username: x[t]['username'].toString()));

          t++;
        }
        print(nurses);
        return WelcomeScreen.users;
      } else {
        print('is not correct');
        return WelcomeScreen.users;
      }
    } catch (exception) {
      print(exception);
      return WelcomeScreen.users;
    }
  }

////////////////////// get request//////////////////////////
  Future<dynamic> netGet(String endpoint) async {
    var url = Uri.parse(
      baseUrl + endpoint,
    );
    try {
      http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Authorization': apiKey,
          'Content-Type': "application/json; charset=utf-8",
        },
      );

      if (response.statusCode == 200) {
        // String body = utf8.decode(response.bodyBytes);
        print('request has completed');
        var x = json.decode(utf8.decode(response.bodyBytes));
        return x;
      } else {
        print('request has not completed');
      }
    } catch (exception) {
      print(exception);
    }
  }

  //////////////// delete request/////////////////////////

  void netDelete(int id, String endpoint) async {
    var url = Uri.parse(
      baseUrl + endpoint + id.toString() + '/',
    );
    try {
      http.Response response = await http.delete(
        url,
        headers: <String, String>{
          'Authorization': apiKey,
        },
      );
      if (response.statusCode == 200) {
        print('is deleted');
      } else {
        print('is not delete');
      }
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<Nurse>> getNurseList() async {
    var x = await netGet(e_get_nurse_list);
    int t = 0;
    for (var i in x) {
      nurses.add(Nurse(
        id: x[t]['id'],
        userId: x[t]['userId'],
        firstName: x[t]['firstName'],
        lastName: x[t]['lastName'],
        gender: x[t]['gender'],
        age: x[t]['age'],
        email: x[t]['email'].toString(),
        phoneNumber: x[t]['phoneNumber'],
        imageUrl: x[t]['imageUrl'],
        state: x[t]['state'],
        city: x[t]['city'],
        workExperience: x[t]['workExperience'],
        workCondition: x[t]['workCondition'],
        created: x[t]['created'].toString(),
      ));

      t++;
    }
    return nurses;
  }

  Future<Nurse> getNurseDetail(int id) async {
    var x = await netGet(e_get_nurse_list);
    Nurse nurse = Nurse(
      userId: x[id]['userId'],
      firstName: x[id]['firstName'],
      lastName: x[id]['lastName'],
      gender: x[id]['gender'],
      age: x[id]['age'],
      email: x[id]['email'].toString(),
      phoneNumber: x[id]['phoneNumber'],
      imageUrl: x[id]['imageUrl'],
      state: x[id]['state'],
      city: x[id]['city'],
      workExperience: x[id]['workExperience'],
      workCondition: x[id]['workCondition'],
      created: x[id]['created'].toString(),
    );

    return nurse;
  }
}
