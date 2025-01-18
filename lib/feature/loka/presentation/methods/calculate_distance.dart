import 'dart:math';

double calculateDistance(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) {
  const double earthRadius = 6371000; 
  final double dLat = _degreeToRadian(endLatitude - startLatitude);
  final double dLon = _degreeToRadian(endLongitude - startLongitude);

  final double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_degreeToRadian(startLatitude)) *
          cos(_degreeToRadian(endLatitude)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadius * c; 
}

double _degreeToRadian(double degree) {
  return degree * pi / 180;
}
