import 'package:flutter/material.dart';

import 'pages/detailspage.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web API',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        // '/details': (context) => DetailsPage(student: null),
      },
    );
  }
}
