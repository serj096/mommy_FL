import 'dart:math';

class Coords {
  static double getCoordsDistance(double lat1, double lon1, double lat2, double lon2) {
    var R = 6371; // радиус земли в километрах
    var dLat = deg2rad(lat2-lat1);
    var dLon = deg2rad(lon2-lon1);
    var a =
        sin(dLat/2) * sin(dLat/2) +
            cos(deg2rad(lat1)) * cos(deg2rad(lat2)) *
                sin(dLon/2) * sin(dLon/2);
    var c = 2 * atan2(sqrt(a), sqrt(1-a));
    var d = R * c; // расстояние в км
    return d;
  }

  static double deg2rad(double deg) {
    return deg * (pi/180);
  }
}