import 'dart:async';

import 'package:my_app/models/newsItem.dart';
import 'package:my_app/services/services.dart';

class ArticleController {
  final HttpServices services;
  List<NewsItem> articles = [];

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  ArticleController(this.services);

  Future<List<NewsItem>> fetchArticles() async {
    onSyncController.add(true);
    articles = await services.getNewsItems();
    onSyncController.add(false);
    return articles;
  }
}
