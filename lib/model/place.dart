
import 'package:flutter_geometry_app/model/address.dart';

class Place {
  Address address;
  List<String> categories;
  String name;
  Place(
    this.address,
    this.categories,
    this.name,
  )
}