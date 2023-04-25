import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const Marker _kShopMarker = Marker(
    markerId: MarkerId('_Shop'),
    infoWindow: InfoWindow(title: "เสื้อยืดมือสองbyหนึ่งศาลายา"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(13.810895804903794, 100.32228714350008),
  );

  static const CameraPosition _kShop = CameraPosition(
    target: LatLng(13.810895804903794, 100.32228714350008),
    zoom: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/home');
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
                    Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "น้ำหนึ่ง เสื้อผ้าแฟชั่น มือสองเกรด A",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Salaya, Phutthamonthon District,\n Nakhon Pathom 73170",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
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
