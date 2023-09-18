class RoutingUtils {
  static String toParamaterValue({
    required String uri,
    required String parameter,
    required String value,
  }) {
    return uri.replaceAll(':$parameter', value);
  }
}
