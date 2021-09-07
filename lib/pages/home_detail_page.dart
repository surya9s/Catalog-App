import 'package:flutter/material.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " \$${catalog.price}".toString(),
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Add to cart",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(150, 45)
          ],
          //imorivise
        ).p4(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(16),
              child: Hero(
                child: Image.network(catalog.image),
                tag: Key(catalog.id.toString()),
              ).h40(context),
            ),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      catalog.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: MyTheme.darkBluishColor),
                    ),
                    Text(
                      catalog.desc,
                    ),
                    Text(
                      "VelocityX lets you focus on your design, and it comes with various widget extensions to make it responsive across the devices. Go ahead and check the docs.",
                      style: TextStyle(color: Colors.black54),
                    ).p16(),
                  ],
                ).py64(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
