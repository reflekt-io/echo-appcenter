// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:echo/common/utils.dart';
import 'package:echo/screens/home_page.dart';
import 'package:journal/dummy_data.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_json.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/widgets/journal_card.dart';

// Jaga-jaga nanti untuk update data, makanya pakai stateful dulu (?)
class JournalHomePage extends StatefulWidget {
  const JournalHomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/journal';

  @override
  State<JournalHomePage> createState() => _JournalHomePageState();
}

class _JournalHomePageState extends State<JournalHomePage> with RouteAware {
  List<Journal> dummyJournal = DUMMY_CATEGORIES.fields;
  // List<Journal> dummyJournal = [];

  @override
  void initState() {
    //Get journals by calling fetchJournal()
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    //Get journals by calling fetchJournal()
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Jurnal'),
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
                      Navigator.pushReplacementNamed(context, HomePage.ROUTE_NAME);
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
                        title: const Text('Buat Kutipan Baru'),
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
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Jurnal Baru'),
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
                        title: const Text('Rekomendasi Ide Kegiatan'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Ide Kegiatan Baru'),
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
                        title: const Text('Lihat Pojok Curhat'),
                        onTap: () {
                          // Go to the page
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Kartu Curhat Baru'),
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
                        title: const Text('Buat Harapan Baru'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            dummyJournal.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Tekan tombol tambah untuk menambahkan jurnal baru.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dummyJournal.length,
                    itemBuilder: (context, index) {
                      return JournalCard(dummyJournal[index]);
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B36A8),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddJournalPage()));
        },
        tooltip: 'Jurnal Baru',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  Future<JournalJson> fetchJournal() async {
    const url = 'https://reflekt-io.herokuapp.com/journal/json/';
    // How to auth?
    JournalJson? data;

    try {
      final response = await http.get(Uri.parse(url));
      //print(response.body);
      data = jsonDecode(response.body);
    } catch (error) {
      //print(error);
    }

    return data!;
  }
}
