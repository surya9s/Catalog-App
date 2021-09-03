import 'package:flutter/material.dart';
import 'package:hear_phone_store/pages/home_page.dart';
import 'package:hear_phone_store/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hear_phone_store/util/routs.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.lato().fontFamily,
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      // for dark theme data
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(brightness: Brightness.dark),

      initialRoute: MyRouts.homeRout,

      routes: {
        "/": (context) => LoginPage(),
        MyRouts.loginRout: (context) => LoginPage(),
        MyRouts.homeRout: (context) => HomePage(),
      },
    );
  }
}
