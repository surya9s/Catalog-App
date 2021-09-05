import 'package:flutter/material.dart';
import 'package:hear_phone_store/pages/home_page.dart';
import 'package:hear_phone_store/pages/login_page.dart';
import 'package:hear_phone_store/util/routs.dart';
import 'package:hear_phone_store/widget/themes.dart';

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
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      // for dark theme data
      // themeMode: ThemeMode.dark,
      darkTheme: MyTheme.darkTheme(context),

      initialRoute: MyRouts.homeRout,

      routes: {
        "/": (context) => LoginPage(),
        MyRouts.loginRout: (context) => LoginPage(),
        MyRouts.homeRout: (context) => HomePage(),
      },
    );
  }
}
