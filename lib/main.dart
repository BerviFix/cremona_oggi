import 'package:flutter/material.dart';

import 'components/app_scaffold.dart';
import 'pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      home: HomePage(),
    );
  }
}
