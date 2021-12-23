// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:echo/common/network_service.dart';
import 'package:flutter/material.dart';
import 'package:echo/common/utils.dart';
import 'package:echo/widgets/drawer_menu.dart';
import 'package:journal/dummy_data.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_json.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/widgets/journal_card.dart';
import 'package:provider/provider.dart';

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
      drawer: const DrawerMenu(JournalHomePage.ROUTE_NAME),
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
          Navigator.pushNamed(context, AddJournalPage.ROUTE_NAME);
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
    final request = context.watch<NetworkService>();
    String url = 'https://reflekt-io.herokuapp.com/journal/json/';
    JournalJson? data;

    try {
      final response = await request.get(url);
      //print(response.body);
      data = jsonDecode(response.body);
    } catch (error) {
      //print(error);
    }

    return data!;
  }
}
