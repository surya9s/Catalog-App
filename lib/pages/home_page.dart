import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/widget/drawer.dart';
import 'package:hear_phone_store/widget/item_wedget.dart';
import 'dart:convert';

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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Phone store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      child: Image.network(item.image),
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.indigo),
                      ),
                      footer: Container(
                        child: Text((item.price.toString()),
                            style: TextStyle(color: Colors.white)),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.indigo),
                      ),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            //  ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ItemWedget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //   )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
    return scaffold;
  }
}
