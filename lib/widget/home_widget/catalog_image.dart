import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogImage extends StatelessWidget {
  final String image;
  const CatlogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      width: 150,
      margin: EdgeInsets.only(left: 8),
      child: Image.network(image)
          .box
          .rounded
          .p8
          .color(context.canvasColor)
          .make()
          .p4()
          .w40(context),
      //decoration: BoxDecoration(color: Colors.white),
    );
  }
}
