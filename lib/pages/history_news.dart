import 'package:flutter/material.dart';
import 'article_detail.dart';

import 'package:cremona_oggi/providers/api.dart';
import 'package:cremona_oggi/models/article.dart';

class HistoryNewsPage extends StatelessWidget {
  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            article.content,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshPost(context),
      color: Colors.red.shade900,
      child: FutureBuilder(
          future: historyNews(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.done:
                dynamic articles = snapshot.data;
                articles.removeRange(0, 10);

                return GridView.count(
                  padding: EdgeInsets.all(16),
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: List.generate(articles.length, (int index) {
                    return buildArticle(context, articles[index]);
                  }),
                );

              default:
                return Center(
                  child: Text('ERRORE'),
                );
            }
          }),
    );
  }
}

Future<List<Article>> _refreshPost(BuildContext context) async {
  return historyNews();
}
