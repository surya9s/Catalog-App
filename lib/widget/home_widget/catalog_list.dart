import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_phone_store/modles/catlouge.dart';
import 'package:hear_phone_store/pages/home_detail_page.dart';
import 'package:hear_phone_store/widget/home_widget/catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        //final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}
