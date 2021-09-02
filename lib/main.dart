import 'package:flutter/material.dart';
import 'package:hear_phone_store/pages/home_page.dart';
import 'package:hear_phone_store/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      // for Light theme data
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // for dark theme data
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(brightness: Brightness.dark),

      initialRoute: "/",

      routes: {
        "/": (context) => LoginPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
