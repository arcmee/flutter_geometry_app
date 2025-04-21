import 'package:flutter_geometry_app/data/model/place.dart';
import 'package:flutter_geometry_app/data/repository/naver_place_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListNotifier extends AutoDisposeNotifier<List<Place>> {
  NaverPlaceRepository repository = NaverPlaceRepository();
  // PlaceListNotifier(this.repository);
  @override
  build() {
    // throw PlaceListNotifier();
    return [];
  }

  void searchByText(String text) async {
    print(text);
    state = await repository.getPlaceByText(text);
  }

  
}

// final repositoryProvider = Provider<NaverPlaceRepository>( (ref) {
//   return NaverPlaceRepository();
// });

final placeListNotifier =
    NotifierProvider.autoDispose<PlaceListNotifier, List<Place>>(() {
      return PlaceListNotifier();
    });
