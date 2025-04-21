import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/data/model/place.dart';
import 'package:flutter_geometry_app/pages/widget/place_list_widget.dart';
import 'package:flutter_geometry_app/pages/widget/viewmodel/place_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Place> places = ref.watch(placeListNotifier);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (value) {
            ref.read(placeListNotifier.notifier).searchByText(value);
          },
          controller: controller,
        ),
        centerTitle: true,
      ),
      body: PlaceListWidget(places),
    );
  }
}