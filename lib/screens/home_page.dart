
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/screens/journal_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 64,
              child: const DrawerHeader(
                child: Text(
                  'reflekt.io',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF24262A),
                ),
              ),
            ),
            ListTile(
              title: const Text('Halaman Utama'),
              onTap: () {
                // Go to Halaman Utama screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Riwayat Jurnal'),
              onTap: () {
                // Go to Riwayat Jurnal screen
                Navigator.pushReplacementNamed(context, JournalHomePage.ROUTE_NAME);
              },
            ),
            ListTile(
              title: const Text('Jurnal Baru'),
              onTap: () {
                // Go to Jurnal Baru page
                Navigator.pushNamed(context, AddJournalPage.ROUTE_NAME);
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                // Log Out (delete cookie) and return to login screen
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ntar ada lah ya :P',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
