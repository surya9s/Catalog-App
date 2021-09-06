import 'package:flutter/cupertino.dart';

import '../themes.dart';

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
