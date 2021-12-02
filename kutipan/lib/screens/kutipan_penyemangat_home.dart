// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kutipan/dummy_data.dart';
import 'package:kutipan/screens/add_kutipan_penyemangat_page.dart';
import 'package:kutipan/models/kutipan_penyemangat.dart';
import 'package:kutipan/widgets/kutipan_penyemangat_card.dart';

class KutipanPenyemangatHomePage extends StatefulWidget {
  const KutipanPenyemangatHomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/kutipan';

  @override
  State<KutipanPenyemangatHomePage> createState() => _Kutipan_PenyemangatHomePageState();
}

class _Kutipan_PenyemangatHomePageState extends State<KutipanPenyemangatHomePage> {
  List<Kutipan_Penyemangat> dummyKutipan_Penyemangat = DUMMY_CATEGORIES.fields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Kutipan Penyemangat'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
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
              title: const Text('List Kutipan Penyemangat Untukmu'),
              onTap: () {
                // Go to List Kutipan Penyemangat screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tambah Kutipan Penyemangat'),
              onTap: () {
                // Go to Kutipan Penyemangat Baru page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddKutipanPenyemangatPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            dummyKutipan_Penyemangat.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Tekan tombol tambah untuk menambahkan kutipan penyemangat baru.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dummyKutipan_Penyemangat.length,
                    itemBuilder: (context, index) {
                      return KutipanPenyemangatCard(dummyKutipan_Penyemangat[index]);
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B36A8),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKutipanPenyemangatPage()));
        },
        tooltip: 'Tambahkan Kutipan Penyemangat',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
