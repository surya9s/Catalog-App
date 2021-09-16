import 'package:flutter/material.dart';
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
            )),
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: _CartList(),
              ),
            ),
            Divider(),
            _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            " \$9999",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Buy",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
          ).wh(120, 45)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_circle),
        ),
        title: Text("item-1"),
      ),
    );
  }
}
