import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Article {
  String title;
  String content;
  String url;
  String urlToImage;

  Article({
    required this.title,
    required this.content,
    required this.url,
    required this.urlToImage,
  });

  factory Article.fromData(dynamic data) {
    String title = Bidi.stripHtmlIfNeeded(data['title']['rendered']);
    String content = Bidi.stripHtmlIfNeeded(data['content']['rendered']);
    String url = data['link'];
    String urlToImage = data['better_featured_image']['source_url'];

    return Article(
      title: title,
      content: content,
      url: url,
      urlToImage: urlToImage,
    );
  }
}
