
import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/pages/widget/place_list_element.dart';

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PlaceListWidget();
      }),
    );
  }
}