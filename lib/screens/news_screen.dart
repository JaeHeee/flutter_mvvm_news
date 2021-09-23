import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/news_article_list_view_model.dart';
import '../widgets/news_grid.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    final listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(),
      body: NewsGrid(
        articles: listViewModel.articles,
      ),
    );
  }
}
