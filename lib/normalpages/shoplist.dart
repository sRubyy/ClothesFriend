import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../read data/get_shop.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  // shop IDS
  List<String> shopIDs = [];

  // get shopIDs
  Future getShopId() async {
    await FirebaseFirestore.instance.collection('shops').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            shopIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getShopId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: shopIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/map');
                        },
                        child: ListTile(
                          title: GetShopData(shopId: shopIDs[index]),
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
