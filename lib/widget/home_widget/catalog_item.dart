import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_image.dart';

import '../themes.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      height: 165,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatlogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: MyTheme.darkBluishColor),
                  ),
                  Text(
                    catalog.desc,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " \$${catalog.price}".toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Buy",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
