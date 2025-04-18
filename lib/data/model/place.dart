import 'package:flutter_geometry_app/data/model/address.dart';

class Place {
  Address address;
  // List<String> categories;
  String category;
  String title;
  Place({ required this.title, required this.category, required this.address});

  Place.fromJson(Map<String, dynamic> map)
  : this(
      title: map['title'],
      category: map['category'],
      address: Address(
        address: map['address'],
        roadAddress: map['roadAddress']
      ),
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'address': address.address,
      'roadAddress' : address.roadAddress,
    };
  }
}
