// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:echo/widgets/drawer_menu.dart';
import 'package:tembok_harapan/dummy_data.dart';
import 'package:tembok_harapan/screens/add_tembok_harapan_page.dart';
import 'package:tembok_harapan/models/tembok_harapan.dart';
import 'package:tembok_harapan/widgets/tembok_harapan_card.dart';

class TembokHarapanHomePage extends StatefulWidget {
  const TembokHarapanHomePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/tembok-harapan';

  @override
  State<TembokHarapanHomePage> createState() => _Tembok_HarapanHomePageState();
}

class _Tembok_HarapanHomePageState extends State<TembokHarapanHomePage> {
  List<Tembok_Harapan> dummyTembok_Harapan = DUMMY_CATEGORIES.fields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kumpulan Harapan'),
      ),
      drawer: const DrawerMenu(TembokHarapanHomePage.ROUTE_NAME),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            dummyTembok_Harapan.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Tekan tombol tambah untuk menambahkan harapan baru.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dummyTembok_Harapan.length,
                    itemBuilder: (context, index) {
                      return TembokHarapanCard(dummyTembok_Harapan[index]);
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
                  builder: (context) => const AddTembokHarapanPage()));
        },
        tooltip: 'Tambahkan Harapan',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
