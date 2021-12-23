import 'package:flutter/material.dart';

import 'package:kutipan/screens/kutipan_penyemangat_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /*
  Colors:
  - Backgrounds, navbar - black #24262a
  - Backgrounds - light gray #f7f9fb
  - Buttons, icons - blue #0b36a8
  - Headings text - black #24262a
  - Body text - dark gray #4d5055
  */

  // Custom colors
  static Map<int, Color> themeColor = {
    // 0xFF24262A
    50: const Color.fromRGBO(36, 38, 42, .1),
    100: const Color.fromRGBO(36, 38, 42, .2),
    200: const Color.fromRGBO(36, 38, 42, .3),
    300: const Color.fromRGBO(36, 38, 42, .4),
    400: const Color.fromRGBO(36, 38, 42, .5),
    500: const Color.fromRGBO(36, 38, 42, .6),
    600: const Color.fromRGBO(36, 38, 42, .7),
    700: const Color.fromRGBO(36, 38, 42, .8),
    800: const Color.fromRGBO(36, 38, 42, .9),
    900: const Color.fromRGBO(36, 38, 42, 1),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reflekt.io - Kutipan Penyemangat',
      theme: ThemeData(
        // This is the theme of your application.a
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xFF24262A, themeColor),
      ),
      home: const KutipanPenyemangatHomePage(),
    );
  }
}
