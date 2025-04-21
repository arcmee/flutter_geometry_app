import 'package:flutter_geometry_app/data/repository/vworld_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class VworldNotifier extends StateNotifier<List<String>>{
  final VworldRepository repository;
  VworldNotifier(this.repository) : super([]);

  Future<List<String>> getByLatLng(Position position) async{
    final places = repository.getByLatlng(position);
    print(places);
    return places;
  }
}

final repositoryProvider = Provider<VworldRepository>((ref) {
  return VworldRepository();
});

final vworldNotifier = StateNotifierProvider<VworldNotifier, List<String>>( (ref) {
  final repository = ref.watch(repositoryProvider);
  return VworldNotifier(repository);
});
