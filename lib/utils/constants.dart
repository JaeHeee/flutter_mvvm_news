import 'config.dart';

class Constants {
  static const String topHeadlinesUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=${Config.apiKey}';

  static const Map<String, String> countries = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'ch',
  };

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=${Config.apiKey}';
  }
}
