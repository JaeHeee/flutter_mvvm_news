import 'package:dio/dio.dart';
import '../config/config.dart';
import '../models/news_article.dart';

class WebService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${Config.apiKey}';

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to get top news');
    }
  }
}
