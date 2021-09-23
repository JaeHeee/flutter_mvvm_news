import 'package:dio/dio.dart';
import 'package:flutter_mvvm_news_app/models/news_article.dart';
import 'package:flutter_mvvm_news_app/service/web_service.dart';
import 'package:flutter_mvvm_news_app/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_top_headline_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('fetchTopHeadLines', () {
    test('fetchTopHeadLines completes successfully', () async {
      final dio = MockDio();

      when(dio.get(Constants.topHeadlinesUrl))
          .thenAnswer((_) async => Future.value(
                Response(
                  data: {'status': 'ok', 'totalResults': '', 'articles': []},
                  statusCode: 200,
                  requestOptions: RequestOptions(path: ''),
                ),
              ));

      expect(
          await WebService().fetchTopHeadLines(dio), isA<List<NewsArticle>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final dio = MockDio();

      when(dio.get(Constants.topHeadlinesUrl))
          .thenAnswer((_) async => Future.value(
                Response(
                  data: {'status': 'error', 'code': '', 'message': ''},
                  statusCode: 401,
                  requestOptions: RequestOptions(path: ''),
                ),
              ));

      expect(WebService().fetchTopHeadLines(dio), throwsException);
    });
  });
}
