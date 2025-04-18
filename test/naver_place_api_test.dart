
import 'package:flutter_geometry_app/data/repository/naver_place_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('naver place api test', () async {
    final repository = NaverPlaceRepository();
    final result = await repository.getPlaceByText('수리산');
    result!.forEach((e) {
      print(e.title);
    });
    expect( result!.isEmpty , false);
  });
}