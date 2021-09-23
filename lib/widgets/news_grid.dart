import 'package:flutter/material.dart';

import '../view_models/news_article_view_model.dart';
import 'circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsGrid({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final article = articles[index];

        return GridTile(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: CircleImage(
              imageUrl: article.imageUrl,
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              article.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
