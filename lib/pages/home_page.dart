import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/widget/drawer.dart';
import 'package:hear_phone_store/widget/item_wedget.dart';
import 'dart:convert';

import 'package:hear_phone_store/widget/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              Expanded(child: CatalogList())
            else
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
      // backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: Text('Phone store'),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items.isNotEmpty)
      //       ? GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 10,
      //             crossAxisSpacing: 8,
      //           ),
      //           itemBuilder: (context, index) {
      //             final item = CatalogModel.items[index];
      //             return Card(
      //               clipBehavior: Clip.antiAlias,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10)),
      //               child: GridTile(
      //                 child: Image.network(item.image),
      //                 header: Container(
      //                   child: Text(
      //                     item.name,
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   padding: EdgeInsets.all(12),
      //                   decoration: BoxDecoration(color: Colors.indigo),
      //                 ),
      //                 footer: Container(
      //                   child: Text((item.price.toString()),
      //                       style: TextStyle(color: Colors.white)),
      //                   padding: EdgeInsets.all(12),
      //                   decoration: BoxDecoration(color: Colors.indigo),
      //                 ),
      //               ),
      //             );
      //           },
      //           itemCount: CatalogModel.items.length,
      //         )
      //       //  ListView.builder(
      //       //     itemCount: CatalogModel.items.length,
      //       //     itemBuilder: (BuildContext context, int index) {
      //       //       return ItemWedget(
      //       //         item: CatalogModel.items[index],
      //       //       );
      //       //     },
      //       //   )
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      // drawer: MyDrawer(),
    );
    return scaffold;
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Catalog App',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: MyTheme.darkBluishColor),
          ),
          Text(
            'Trending Products',
            style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
                color: MyTheme.darkBluishColor),
          )
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

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
          CatlogImage(
            image: catalog.image,
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
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Buy",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyTheme.darkBluishColor),
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                        ),
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

class CatlogImage extends StatelessWidget {
  final String image;
  const CatlogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      width: 150,
      margin: EdgeInsets.only(left: 8),
      child: Image.network(image),
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
