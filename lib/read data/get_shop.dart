import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetShopData extends StatelessWidget {
  final String shopId;

  GetShopData({required this.shopId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference shops = FirebaseFirestore.instance.collection('shops');

    return FutureBuilder<DocumentSnapshot>(
        future: shops.doc(shopId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['name']}');
          }
          return const Text('loading...');
        }));
  }
}
