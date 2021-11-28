// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/screens/journal_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/home';

  // Color themes
  static const blackColorTheme = Color(0xFF24262A);
  static const blueColorTheme = Color(0xFF0B36A8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          // Nanti jangan pakai const (variable, cuy)
          "Halo, username!",
        ),
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
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    title: const Text('Halaman Utama'),
                    onTap: () {
                      // Go to Halaman Utama screen
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Deteksi Dini Depresi'),
                    onTap: () {
                      // Go to deteksi screen
                    },
                  ),
                  ExpansionTile(
                    title: const Text("Kutipan Penyemangat"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Lihat Kutipan Penyemangat'),
                        onTap: () {
                          // Go to KutipanHome screen
                        },
                      ),
                      ListTile(
                        title: const Text('Kutipan Penyemangat Baru'),
                        onTap: () {
                          // Go to Kutipan Baru page
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Jurnal"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Riwayat Jurnal'),
                        onTap: () {
                          // Go to Riwayat Jurnal screen
                          Navigator.pushReplacementNamed(
                              context, JournalHomePage.ROUTE_NAME);
                        },
                      ),
                      ListTile(
                        title: const Text('Jurnal Baru'),
                        onTap: () {
                          // Go to Jurnal Baru page
                          Navigator.pushNamed(
                              context, AddJournalPage.ROUTE_NAME);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Ide Kegiatan"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Lihat Ide Kegiatan'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                      ListTile(
                        title: const Text('Ide Kegiatan Baru'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Pojok Curhat"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Riwayat Kartu Curhat'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                      ListTile(
                        title: const Text('Kartu Curhat Baru'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text("Tembok Harapan"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Lihat Tembok Harapan'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                      ListTile(
                        title: const Text('Harapan Baru'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    title: const Text('Tentang Kami'),
                    onTap: () {
                      // Go to About Us
                    },
                  ),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Apa yang ingin kamu lakukan hari ini?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: <Widget>[
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Deteksi Dini Depresi",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Lihat Kutipan Penyemangat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Buat Kutipan Penyemangat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to JournalHomePage
                        Navigator.pushNamed(
                            context, JournalHomePage.ROUTE_NAME);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Lihat Riwayat Jurnal",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to AddJournalPage
                        Navigator.pushNamed(context, AddJournalPage.ROUTE_NAME);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Buat Jurnal Baru",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Lihat Ide Kegiatan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Buat Ide Kegiatan Baru",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Lihat Pojok Curhat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Buat Kartu Curhat Baru",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Lihat Tembok Harapan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Buat Harapan Baru",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: blueColorTheme,
                    child: InkWell(
                      onTap: () {
                        // Go to ... screen
                        print('I was clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Tentang Kami",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
