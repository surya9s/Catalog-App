import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hear_phone_store/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
            style: TextStyle(),
          )),
      backgroundColor: MyTheme.creamColor,
    );
  }
}
