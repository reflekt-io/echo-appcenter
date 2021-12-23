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
  List<JournalJson> dummyJournal = DUMMY_CATEGORIES;
  // List<Journal> dummyJournal = [];
  List<Journal> journal = [];

  @override
  void initState() {
    // fetchJournal();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    // fetchJournal();
  }

  @override
  Widget build(BuildContext context) {
    fetchJournal();
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
                      return JournalCard(dummyJournal[index].fields);
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

  dynamic fetchJournal() async {
    final request = context.watch<NetworkService>();
    String url = 'http://127.0.0.1:8000/journal/json';
    dynamic data;

    final response = await request.get(url);
    data = json.decode(response).map((m)=> JournalJson.fromJson(m)).toList();
    print(data);

    try {
      final response = await request.get(url);
      data = json.decode(response).map((m)=> JournalJson.fromJson(m)).toList();
      print(data);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
      return null;
    }

    return data;
  }
}
