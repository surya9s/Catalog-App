import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/util/routs.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_header.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_list.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRouts.cartRout);
        },
        child: Icon(CupertinoIcons.cart, color: Colors.white),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              Expanded(child: CatalogList())
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.darkBluishColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    return scaffold;
  }
}
