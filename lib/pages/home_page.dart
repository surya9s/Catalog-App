import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Head Phone store')),
      ),
      body: Center(
        child: Container(
          child: Text('Flutter Demo Home Page'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
