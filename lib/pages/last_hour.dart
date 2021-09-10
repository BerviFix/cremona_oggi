import 'package:flutter/material.dart';
import 'article_detail.dart';

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

  Widget builderHeadline(BuildContext context) {
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
              color: Colors.indigo,
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
            'Casa bianca, Tarrant come pelosi e Correntz - Ultima Ora ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticle(BuildContext context) {
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
                  'Casa bianca, Tarrant come pelosi e Correntz - Ultima Ora ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.',
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
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 1 + 10,
      itemBuilder: (context, index) {
        if (index == 0)
          return builderHeader();
        else if (index == 1)
          return Padding(
            padding: EdgeInsets.only(top: 32),
            child: builderHeadline(context),
          );
        else
          return Padding(
            padding: EdgeInsets.only(top: 16),
            child: buildArticle(context),
          );
      },
    );
  }
}
