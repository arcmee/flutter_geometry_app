class PositionLatLng {
  final double _lat;
  final double _lng;

  const PositionLatLng({required double lat,required double lng}) : _lat = lat, _lng = lng;

  double get lat => _lat;
  double get lng => _lng;
}