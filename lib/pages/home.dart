import 'package:flutter/material.dart';
import 'last_hour.dart';
import 'history_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cremona Today'),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.red.shade900,
      ),
      // drawer: Container(
      //   width: 300,
      //   color: Colors.white,
      //   child: SafeArea(
      //     child: Container(),
      //   ),
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          LastHour(),
          HistoryNewsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        backgroundColor: Colors.red.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.linear);
        },
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
