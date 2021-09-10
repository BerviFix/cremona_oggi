import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class AppScaffold extends StatelessWidget {
  AppScaffold({required this.home});
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: home,
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/cremonaoggi_logo.png'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Container(
        width: 300,
        color: Colors.white,
        child: SafeArea(
          child: Container(),
        ),
      ),
      body: PageView(
        children: [
          LastHour(),
          HistoryNews(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.red.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: "Ultima ora",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_full_rounded),
            label: "Passati",
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      //   elevation: 2.0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         IconButton(
      //           tooltip: 'Open navigation menu',
      //           icon: const Icon(Icons.home),
      //           label:
      //           onPressed: () {},
      //           color: Colors.white,
      //         ),
      //         IconButton(
      //           tooltip: 'Open navigation menu',
      //           icon: const Icon(Icons.home),
      //           onPressed: () {},
      //           color: Colors.white,
      //         ),
      //       ],
      //     ),
      //     shape: CircularNotchedRectangle(),
      //     color: Colors.red.shade900),
    );
  }
}

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

  Widget builderHeadline() {
    return Column(
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
            child: builderHeadline(),
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

class HistoryNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: List.generate(10, (int index) {
        return Column(
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
        );
      }),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
      ),
    );
  }
}
