import 'package:flutter/material.dart';

import '../models/news_article.dart';
import '../service/web_service.dart';
import 'news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> _articles = <NewsArticleViewModel>[];

  List<NewsArticleViewModel> get articles => _articles;
  LoadingStatus get loadingStatus => _loadingStatus;

  void topHeadLines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    _loadingStatus = LoadingStatus.searching;
    notifyListeners();

    _articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (_articles.isEmpty) {
      _loadingStatus = LoadingStatus.empty;
    } else {
      _loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
