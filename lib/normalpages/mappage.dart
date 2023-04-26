import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/shop_model.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late ShopModel _shop; // define a field to store the ShopModel

  static Marker shopToMarker(ShopModel shop) {
    return Marker(
      markerId: MarkerId(shop.id!),
      position: LatLng(shop.lat, shop.lng),
      infoWindow: InfoWindow(
        title: shop.name,
      ),
    );
  }

  static CameraPosition shopToCarmeraPosition(ShopModel shop) {
    return CameraPosition(
      target: LatLng(shop.lat, shop.lng),
      zoom: 20,
    );
  }

  late final Marker _kShopMarker;

  late final CameraPosition _kShop;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // get the shop object from the route arguments
    _shop = ModalRoute.of(context)!.settings.arguments as ShopModel;
    _kShopMarker = shopToMarker(_shop);
    _kShop = shopToCarmeraPosition(_shop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/home', arguments: {'selectedIndex': 1});
          },
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              markers: {_kShopMarker},
              initialCameraPosition: _kShop,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 140,
                color: Colors.orange[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        "assets/images/store.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _shop.name,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            _shop.address,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
