class NewsItem {
  //final Source source;
  final String author;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsItem(this.author, this.title, this.url, this.urlToImage, this.publishedAt, this.content);
  //NewsItem(this.author, this.title, this.publishedAt, this.content);

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      //json['source'] as Source,
      json['author'].toString() as String,
      json['title'].toString() as String,
      json['url'].toString() as String,
      json['urlToImage'].toString() as String,
      json['publishedAt'].toString() as String,
      json['content'].toString() as String
    );
  }
}
