import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        actions: [
          IconButton(
            onPressed: () {
              launch(
                  'https://pub.dev/documentation/url_launcher/latest/link/link-library.html');
            },
            icon: Icon(Icons.link),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: [
              Text(
                'NOTIZIA CORRENTE',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Casa bianca, Tarrant come pelosi e Correntz - Ultima Ora ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
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
              height: 32,
            ),
            Text(
              'Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
