import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/newsItem.dart';

class HttpServices {
  Future<List<NewsItem>> getNewsItems() async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'us', 'apiKey': 'c6af5a55ce744353bf9744ad09314724'});
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var all = jsonDecode(response.body);
      //var numOfArticles = all["totalResults"];
      var allArticles = all["articles"];
      //print(numOfArticles);
      List<NewsItem> newsItems = [];
      for (var article in allArticles) {
        print(article);
        newsItems.add(NewsItem.fromJson(article));
      }
      return newsItems;
    } else {
      print('Response status: ${response.statusCode}');
      throw Exception('failed to get news from source');
    }
  }

    Future<List<NewsItem>> getNewsItemsCategory(String category) async {
    var url = Uri.https('newsapi.org', '/v2/top-headlines',
        {'country': 'us', 'category': category, 'apiKey': 'c6af5a55ce744353bf9744ad09314724'});
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var all = jsonDecode(response.body);
      //var numOfArticles = all["totalResults"];
      var allArticles = all["articles"];
      //print(numOfArticles);
      List<NewsItem> newsItems = [];
      for (var article in allArticles) {
        print(article);
        newsItems.add(NewsItem.fromJson(article));
      }
      return newsItems;
    } else {
      print('Response status: ${response.statusCode}');
      throw Exception('failed to get news from source');
    }
  }
}
