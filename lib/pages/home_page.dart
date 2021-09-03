import 'package:flutter/material.dart';
import 'package:hear_phone_store/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Head Phone store'),
      ),
      body: Center(
        child: Container(
          child: Text('Flutter Demo Home Page'),
        ),
      ),
      drawer: MyDrawer(),
    );
    return scaffold;
  }
}
