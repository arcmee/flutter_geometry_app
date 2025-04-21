import 'package:dio/dio.dart';
import 'package:flutter_geometry_app/data/model/address.dart';
import 'package:flutter_geometry_app/data/model/place.dart';

class NaverPlaceRepository {
  static final url = 'https://openapi.naver.com/v1/';
  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: url,
      validateStatus: (status) => true,
      headers: {
        'X-Naver-Client-Id' : '6lzr4pqoYlmui6w2Adbi',
        'X-Naver-Client-Secret' : 'dAVU5bFH8y'
      }
    )
  );

  Dio get client => _client;

  Future<List<Place>> getPlaceByText(String text) async {
    final response = await client.get(
      '/search/local.json'
      ,queryParameters: {
        'query' : text,
        'display' : 10,
        'start' : 1,
      }
    );
    if(response.statusCode == 200){
      final content = response.data['items'];
      return List.from(content).map(
        (e) {
          return Place.fromJson(e);
        },
      ).toList();
    }
    return [];
  }
}
  // {
  //   "lastBuildDate": "Thu, 17 Apr 2025 16:44:43 +0900",
  //   "total": 1,
  //   "start": 1,
  //   "display": 1,
  //   "items": [
  //     {
  //       "title": "광정동행정복지센터",
  //       "link": "",
  //       "category": "공공,사회기관>행정복지센터",
  //       "description": "",
  //       "telephone": "",
  //       "address": "경기도 군포시 산본동 1120-2",
  //       "roadAddress": "경기도 군포시 광정로 106 광정동사무소",
  //       "mapx": "1269278880",
  //       "mapy": "373621320"
  //     }
  //   ]
  // }

// class AuthInterceptor extends Interceptor {
// }