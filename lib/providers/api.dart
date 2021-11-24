import 'dart:async';
import 'dart:convert';

import 'package:cremona_oggi/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> lastHour() async {
  final response = await http.get(Uri.parse(
      'https://www.cremonaoggi.it/wp-json/wp/v2/posts?per_page=10&orderby=date'));

  List articles = jsonDecode(utf8.decode(response.bodyBytes));
  return articles.map((data) => Article.fromData(data)).toList();
}

Future<List<Article>> historyNews() async {
  final response = await http.get(Uri.parse(
      'https://www.cremonaoggi.it/wp-json/wp/v2/posts?per_page=50&orderby=date'));

  List articles = jsonDecode(utf8.decode(response.bodyBytes));
  return articles.map((data) => Article.fromData(data)).toList();
}
