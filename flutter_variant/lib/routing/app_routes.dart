/// Path constants for [GoRouter], kept separate from the router config so
/// screens can reference a route without importing the router itself.
abstract final class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String discover = '/discover';
  static const String search = '/search';
  static const String saved = '/saved';
  static const String tourDetails = '/tour-details/:tourId';
  static const String booking = '/booking/:tourId';
  static const String confirmed = '/confirmed';

  static String tourDetailsPath(String tourId) => '/tour-details/$tourId';
  static String bookingPath(String tourId) => '/booking/$tourId';
}
