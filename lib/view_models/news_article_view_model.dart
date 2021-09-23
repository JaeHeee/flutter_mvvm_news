import 'package:intl/intl.dart';

import '../models/news_article.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageUrl {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }

  String get author {
    return _newsArticle.author;
  }

  String get publishedAt {
    final dataTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_newsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dataTime).toString();
  }
}
