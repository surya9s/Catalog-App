// import 'package:flutter/material.dart';
// import 'package:hear_phone_store/modles/catlouge.dart';

// class ItemWedget extends StatelessWidget {
//   final Item item;

//   const ItemWedget({Key? key, required this.item}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         onTap: () {
//           print("${item.name} pressed");
//         },
//         leading: Image.network(item.image),
//         title: Text(item.name),
//         subtitle: Text(item.desc),
//         trailing: Text(
//           '\$${item.price.toString()}',
//           textScaleFactor: 1.2,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.indigo,
//           ),
//         ),
//       ),
//     );
//   }
// }
