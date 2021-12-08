// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:echo/widgets/drawer_menu.dart';
import 'package:pojok_curhat/dummy_data.dart';
import 'package:pojok_curhat/screens/add_pojok_curhat_page.dart';
import 'package:pojok_curhat/models/pojok_curhat.dart';
import 'package:pojok_curhat/widgets/pojok_curhat_card.dart';

class PojokCurhatHomePage extends StatefulWidget {
  const PojokCurhatHomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/pojok-curhat';

  @override
  State<PojokCurhatHomePage> createState() => _PojokCurhatHomePageState();
}

// ignore: camel_case_types
class _PojokCurhatHomePageState extends State<PojokCurhatHomePage> {
  List<Pojok_Curhat> dummyPojok_Curhat = DUMMY_CATEGORIES.fields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Jurnal'),
      ),
      drawer: const DrawerMenu(PojokCurhatHomePage.ROUTE_NAME),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            dummyPojok_Curhat.isEmpty
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
                    itemCount: dummyPojok_Curhat.length,
                    itemBuilder: (context, index) {
                      return PojokCurhatCard(dummyPojok_Curhat[index]);
                    },
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B36A8),
        onPressed: () {
          Navigator.pushNamed(context, AddPojokCurhatPage.ROUTE_NAME);
        },
        tooltip: 'Curhat Baru',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
