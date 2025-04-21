
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class VworldRepository {
  static final url = 'https://api.vworld.kr/req/data';
  static final key = 'E77F52F5-CF7A-35FB-A7B7-0471DED57536';
  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: url,
      validateStatus: (status) => true,

    )
  );


  Future<List<String>> getByLatlng(Position position) async {
    try {
      print('geomFilter  : POINT(${position.latitude} ${position.longitude})');
      final response = await _client.get(
        url,
        queryParameters: {
          'request': 'GetFeature',
          'key': key,
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT(${position.longitude} ${position.latitude})',
          'geometry': false,
          'size': 100,
        },
      );

      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        // Response > result > featureCollection > features >> properties > full_nm
        final features = response.data['response']['result']
            ['featureCollection']['features'];
        final featureList = List.from(features);
        final iterable = featureList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }

      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Dio get client => _client;
}