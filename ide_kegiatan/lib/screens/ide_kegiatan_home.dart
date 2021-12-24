import 'package:flutter/material.dart';
import 'package:echo/common/network_service.dart';
import 'package:provider/provider.dart';
import 'package:echo/widgets/drawer_menu.dart';
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
  List<Rekomendasi> dummyRekomendasi = DUMMY_REKOMENDASI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ide Kegiatan'),
      ),
      drawer: const DrawerMenu(IdeKegiatanHomePage.ROUTE_NAME),
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
              child: FutureBuilder(
                  future: fetchKegiatan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Kegiatan>? kegiatan =
                          snapshot.data as List<Kegiatan>;
                      return kegiatan.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: Text(
                                  'Tekan tombol tambah untuk menambahkan kegiatan baru.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: kegiatan.length,
                              itemBuilder: (context, index) {
                                return KegiatanCard(kegiatan[index]);
                              },
                            );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemCount: dummyKegiatan.length,
              //   itemBuilder: (context, index) {
              //     return KegiatanCard(dummyKegiatan[index]);
              //   },
              // ),
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

  Future<List<Kegiatan>> fetchKegiatan() async {
    final request = context.watch<NetworkService>();
    String url = 'http://127.0.0.1:8000/refleksi/add-deskripsi';

    final response = await request.get(url);

    List<Kegiatan> result = [];
    for (var d in response) {
      if (d != null) {
        result.add(Kegiatan.fromJson(d));
      }
    }

    return result;
  }
}
