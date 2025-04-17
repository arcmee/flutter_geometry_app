
import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/pages/widget/address_list_element.dart';

class AddressListWidget extends StatelessWidget {
  const AddressListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return AddressListElement();
      }),
    );
  }
}