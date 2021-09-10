import 'package:flutter/material.dart';
import 'article_detail.dart';

class HistoryNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(10, (int index) {
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
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Casa bianca, Tarrant come pelosi e Correntz - Ultima Ora ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
