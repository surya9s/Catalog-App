import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_header.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_list.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
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
