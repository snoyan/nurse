// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../data.dart';
import '../../net/nurse_model.dart';
import '../../net/welcome_screen.dart';
import '../ads/components/person_card.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search_screen";

  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Nurse> result = [];
  List<Nurse> nurses = WelcomeScreen.nurseList;
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, data, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 40.0,
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  decoration: BoxDecoration(
                    color: kBaseColor1.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    autofocus: true,
                    onTap: () {
                      if (ModalRoute.of(context)!.settings.name !=
                          SearchScreen.routeName) {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      }
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        final List<Nurse> result2 = nurses
                            .where((element) =>
                                element.firstName!
                                    .toLowerCase()
                                    .contains(value) ||
                                element.lastName!.contains(value))
                            .toList();
                        setState(() {
                          result = result2;
                        });
                      } else {
                        setState(() {
                          result.clear();
                        });
                      }
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "جست و جو ",
                        hintStyle: TextStyle(fontSize: 16),
                        prefixIcon: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.search,
                          ),
                        )),
                  ),
                ),
              ),
              SearchResult(
                result: result,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.result}) : super(key: key);
  final List<Nurse> result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: SingleChildScrollView(
        child: Wrap(
          children: List.generate(
            result.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 8,
                ),
                //padding: EdgeInsets.only(left: 10),
                child: PersonCard(
                  nurse: result[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
