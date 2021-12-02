import 'package:flutter/material.dart';
import 'package:pojok_curhat/dummy_data.dart';
import 'package:pojok_curhat/screens/add_pojok_curhat_page.dart';
import 'package:pojok_curhat/models/pojok_curhat.dart';
import 'package:pojok_curhat/widgets/pojok_curhat_card.dart';

class PojokCurhatHomePage extends StatefulWidget {
  const PojokCurhatHomePage({Key? key}) : super(key: key);

  @override
  State<PojokCurhatHomePage> createState() => _Pojok_CurhatHomePageState();
}

class _Pojok_CurhatHomePageState extends State<PojokCurhatHomePage> {
  List<Pojok_Curhat> dummyPojok_Curhat = DUMMY_CATEGORIES.fields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Jurnal'),
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
              title: const Text('Riwayat Curhat'),
              onTap: () {
                // Go to Riwayat Curhat screen
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Curhat Baru'),
              onTap: () {
                // Go to Jurnal Baru page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPojokCurhatPage(),
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddPojokCurhatPage()));
        },
        tooltip: 'Curhat Baru',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
