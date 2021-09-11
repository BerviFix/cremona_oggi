import 'package:flutter/material.dart';
import 'article_detail.dart';

import 'package:cremona_oggi/providers/api.dart';
import 'package:cremona_oggi/models/article.dart';

class LastHour extends StatelessWidget {
  Widget builderHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notizie dell'ultima ora",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Ecco le ultime news!",
              style: TextStyle(),
            ),
          ],
        ),
        Column(
          children: [],
        ),
      ],
    );
  }

  Widget builderHeadline(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
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
            'NOTIZIE DI PUNTA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            article.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(),
            ));
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  article.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.urlToImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
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
          future: lastHour(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.done:
                dynamic articles = snapshot.data;

                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: 1 + 10,
                  itemBuilder: (context, index) {
                    if (index == 0)
                      return builderHeader();
                    else if (index == 1)
                      return Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: builderHeadline(context, articles[index - 1]),
                      );
                    else
                      return Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: buildArticle(context, articles[index - 2 + 1]),
                      );
                  },
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
  return lastHour();
}
