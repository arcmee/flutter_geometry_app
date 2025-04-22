
import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/data/model/place.dart';
import 'package:flutter_geometry_app/pages/widget/place_list_element.dart';
import 'package:flutter_geometry_app/pages/widget/viewmodel/place_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget(this.places, this.isLoaded, {super.key});
  final List<Place> places;
  final isLoaded;

  @override
  Widget build(BuildContext context,) {
    print('length : ${places.length}');
    return Container(
      child: isLoaded ? ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return PlaceListElement(places[index]);
      }) : Center(child: CircularProgressIndicator()),
    );
  }
}