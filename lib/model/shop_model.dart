import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShopModel {
  final String? id;
  final String name;
  final String description;
  final double lat;
  final double lng;
  final String address;

  const ShopModel({
    this.id,
    required this.name,
    required this.description,
    required this.lat,
    required this.lng,
    required this.address,
  });

  toJson() {
    return {"name": name, "description": description, "lat": lat, "lng": lng};
  }

  factory ShopModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ShopModel(
      id: document.id,
      name: data["name"],
      description: data["description"],
      lat: data["lat"],
      lng: data["lng"],
      address: data["address"],
    );
  }
}
