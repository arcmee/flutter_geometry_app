import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/data/model/place.dart';
import 'package:flutter_geometry_app/pages/link_page/link_page.dart';

class PlaceListElement extends StatelessWidget {
  const PlaceListElement(this.place, {super.key});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(place.link);
        if (place.link != '') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LinkPage(place.link);
              },
            ),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              place.link == ''
                  ? Colors.blueAccent
                  : const Color.fromARGB(255, 172, 204, 255),
          border: Border.all(color: Colors.black87),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(place.category, style: TextStyle(fontSize: 15)),
            SizedBox(height: 3),
            Text(place.address.address, style: TextStyle(fontSize: 12)),
            SizedBox(height: 3),
            Text(place.address.roadAddress, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
