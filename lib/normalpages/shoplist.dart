import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectapp/model/shop_model.dart';
import 'package:projectapp/normalpages/profilepage.dart';
import 'package:projectapp/normalpages/startpage.dart';

import '../read data/get_shop.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  List<ShopModel> shops = [];

  // get shops
  Future<List<ShopModel>> getShops() async {
    await FirebaseFirestore.instance.collection('shops').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            final shop = ShopModel(
              id: document.reference.id,
              name: document.get('name'),
              lat: document.get('lat') as double,
              lng: document.get('lng') as double,
              description: document.get('description'), 
              address: document.get('address'),
            );
            shops.add(shop);
          }),
        );
    return shops;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getShops(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: shops.length,
                  itemBuilder: (context, index) {
                    final shop = shops[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/map', arguments: shop);
                        },
                        child: ListTile(
                          title: GetShopData(shopId: shops[index].id!),
                          tileColor: Colors.grey,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
