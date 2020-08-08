import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './utils/themes.dart';
import './pages/page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness UI',
      theme: kDefaultTheme,
      home: HomePage(),
    );
  }
}
