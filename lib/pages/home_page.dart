import 'package:flutter/material.dart';
import 'package:flutter_geometry_app/core/geolocator.dart';
import 'package:flutter_geometry_app/data/model/place.dart';
import 'package:flutter_geometry_app/pages/widget/place_list_widget.dart';
import 'package:flutter_geometry_app/pages/widget/viewmodel/load_notifier.dart';
import 'package:flutter_geometry_app/pages/widget/viewmodel/place_list_view_model.dart';
import 'package:flutter_geometry_app/pages/widget/viewmodel/vworld_notifier.dart';
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
    final vworldvm = ref.watch(vworldNotifier.notifier);
    final isLoaded = ref.watch(loadNotifier);
    final loadVm = ref.read(loadNotifier.notifier);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (value) {
            loadVm.loading();
            ref.read(placeListNotifier.notifier).searchByText(value).then((_) {
              loadVm.loaded();
            });
          },
          controller: controller,
        ),
        actions: [
          IconButton(onPressed: () async {
            loadVm.loading();
            GeolocatorHelper.getPositon().then((position) {
              vworldvm.getByLatLng(position!).then((positionNames) {
                ref.read(placeListNotifier.notifier).searchByText(positionNames.first).then((_)
                {
                  loadVm.loaded();
                });
              });
            });
            // final positionNames = await vworldvm.getByLatLng(position!);
            // ref.read(placeListNotifier.notifier).searchByText(positionNames.first);
          }, icon: Icon(Icons.gps_fixed))
        ],
        centerTitle: true,
      ),
      body: PlaceListWidget(places, isLoaded),
    );
  }
}