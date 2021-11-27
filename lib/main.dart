import 'package:flutter/material.dart';
import 'package:echo/common/utils.dart';
import 'package:echo/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reflekt.io',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: (ke login screen intinya)
      home: const HomePage(),
      navigatorObservers: [routeObserver],
    );
  }
}
