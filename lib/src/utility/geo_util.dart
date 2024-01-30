class GeoUtil {
  static String? formatDistance(double? distance) {
    if (distance == null) {
      return null;
    }

    return '${distance.toStringAsFixed(1)} km';
  }
}
