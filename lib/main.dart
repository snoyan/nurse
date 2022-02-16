import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'constant.dart';
import 'data.dart';
import 'route.dart';

void main() {
  runApp(const MyApp());
}

///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales.
        ],
        locale: const Locale(
            "fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
        title: ' همیار کودک',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: kBaseColor5),
            scaffoldBackgroundColor: kBaseColor5
            // primarySwatch: Colors.blue,
            ),
        routes: myRoutes,
        initialRoute: '/welcome_screen',
      ),
    );
  }
}
