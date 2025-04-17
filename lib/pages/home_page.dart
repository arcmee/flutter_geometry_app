import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/pages/widget/address_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        centerTitle: true,
      ),
      body: AddressListWidget(),
    );
  }
}