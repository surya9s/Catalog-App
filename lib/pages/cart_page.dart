import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "Cart",
            )),
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(
          child: Text(
            "Cart",
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
