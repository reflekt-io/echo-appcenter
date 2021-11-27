import 'package:flutter/material.dart';
import 'package:echo/common/utils.dart';
import 'package:echo/screens/home_page.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/screens/journal_home_page.dart';

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
        title: 'reflekt.io',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF24262A, themeColor),
        ),
        // home: (ke login screen intinya)
        home: const HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case JournalHomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const JournalHomePage());
            case AddJournalPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => const AddJournalPage());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        });
  }
}
