import 'package:flutter_geometry_app/data/model/address.dart';
import 'package:flutter_geometry_app/util/util.dart';

class Place {
  Address address;
  // List<String> categories;
  String category;
  String title;
  String link;
  Place({ required this.title, required this.category, required this.address, required this.link});

  Place.fromJson(Map<String, dynamic> map)
  : this(
      title: removeAllHtmlTags(map['title']),
      category: map['category'],
      address: Address(
        address: map['address'],
        roadAddress: map['roadAddress']
      ),
      link : httpToHttps(map['link']),
  );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'address': address.address,
      'roadAddress' : address.roadAddress,
      'link' : link,
    };
  }
}
