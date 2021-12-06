import 'package:flutter/material.dart';
import 'package:ide_kegiatan/dummy_data.dart';
import 'package:ide_kegiatan/models/kegiatan.dart';
import 'package:ide_kegiatan/models/rekomendasi.dart';
import 'package:ide_kegiatan/screens/add_ide_kegiatan.dart';
import 'package:ide_kegiatan/widgets/kegiatan_card.dart';
import 'package:ide_kegiatan/widgets/rekomendasi_card.dart';

class IdeKegiatanHomePage extends StatefulWidget {
  const IdeKegiatanHomePage({Key? key}) : super(key: key);
  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/refleksi';

  @override
  State<IdeKegiatanHomePage> createState() => _IdeKegiatanHomePageState();
}

class _IdeKegiatanHomePageState extends State<IdeKegiatanHomePage> {
  List<Kegiatan> dummyKegiatan = DUMMY_KEGIATAN;
  List<Rekomendasi> dummyRekomendasi = DUMMY_REKOMENDASI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ide Kegiatan'),
      ),
      drawer: Drawer(
        child: ListView(
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
              title: const Text('Ide Kegiatan'),
              onTap: () {
                // Go to Ide Kegiatan
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tambah Kegiatan'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddRekomendasiKegiatanPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  left: 30, top: 20, right: 30, bottom: 0),
              child: const Text("Kegiatan yang pernah kamu lakukan sebelumnya",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, top: 0, right: 10, bottom: 15),
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(
                minHeight: 30,
                maxHeight: 375,
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dummyKegiatan.length,
                itemBuilder: (context, index) {
                  return KegiatanCard(dummyKegiatan[index]);
                },
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
              child: const Text(
                  "Beberapa rekomendasi kegiatan yang dapat kamu lakukan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, top: 0, right: 10, bottom: 20),
              padding: const EdgeInsets.all(10),
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dummyRekomendasi.length,
                itemBuilder: (context, index) {
                  return RekomendasiCard(dummyRekomendasi[index]);
                },
              ),
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
                  builder: (context) => const AddRekomendasiKegiatanPage()));
        },
        tooltip: 'Tambah Kegiatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
