class RoutingUtils {
  static String toParameterValue({
    required String uri,
    required String parameter,
    required String value,
  }) {
    return uri.replaceAll(':$parameter', value);
  }
}
