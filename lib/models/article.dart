import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

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
    String title = removeAllHtmlTags(data['title']['rendered']);
    print(title);
    String content = removeAllHtmlTags(data['content']['rendered']);
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
