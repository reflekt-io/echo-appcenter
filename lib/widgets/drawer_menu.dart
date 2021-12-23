import 'package:flutter/material.dart';
import 'package:about_us/screens/about_us.dart';
import 'package:deteksi_depresi/screens/phq9_page.dart';
import 'package:echo/screens/home_page.dart';
import 'package:journal/screens/add_journal_page.dart';
import 'package:journal/screens/journal_home_page.dart';
import 'package:kutipan/screens/add_kutipan_penyemangat_page.dart';
import 'package:kutipan/screens/kutipan_penyemangat_home.dart';
import 'package:pojok_curhat/screens/add_pojok_curhat_page.dart';
import 'package:pojok_curhat/screens/pojok_curhat_home.dart';
import 'package:ide_kegiatan/screens/add_ide_kegiatan.dart';
import 'package:ide_kegiatan/screens/ide_kegiatan_home.dart';

class DrawerMenu extends StatelessWidget {
  final String route;

  const DrawerMenu(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      route == HomePage.ROUTE_NAME
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, HomePage.ROUTE_NAME);
                    },
                  ),
                  ListTile(
                    title: const Text('Deteksi Dini Depresi'),
                    onTap: () {
                      route == PHQ9.ROUTE_NAME
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, PHQ9.ROUTE_NAME);
                    },
                  ),
                  ExpansionTile(
                    title: const Text("Kutipan Penyemangat"),
                    children: <Widget>[
                      ListTile(
                        title: const Text('Lihat Kutipan Penyemangat'),
                        onTap: () {
                          route == KutipanPenyemangatHomePage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushReplacementNamed(context, KutipanPenyemangatHomePage.ROUTE_NAME);
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Kutipan Baru'),
                        onTap: () {
                          route == AddKutipanPenyemangatPage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushNamed(context, AddKutipanPenyemangatPage.ROUTE_NAME);
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
                          route == JournalHomePage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushReplacementNamed(context, JournalHomePage.ROUTE_NAME);
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Jurnal Baru'),
                        onTap: () {
                          route == AddJournalPage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushNamed(context, AddJournalPage.ROUTE_NAME);
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
                          route == IdeKegiatanHomePage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushReplacementNamed(context, IdeKegiatanHomePage.ROUTE_NAME);
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Ide Kegiatan Baru'),
                        onTap: () {
                          route == AddRekomendasiKegiatanPage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushNamed(context, AddRekomendasiKegiatanPage.ROUTE_NAME);
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
                          route == PojokCurhatHomePage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushReplacementNamed(context, PojokCurhatHomePage.ROUTE_NAME);
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Kartu Curhat Baru'),
                        onTap: () {
                          route == AddPojokCurhatPage.ROUTE_NAME
                            ? Navigator.pop(context)
                            : Navigator.pushNamed(context, AddPojokCurhatPage.ROUTE_NAME);
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
                      route == AboutUs.ROUTE_NAME
                        ? Navigator.pop(context)
                        : Navigator.pushReplacementNamed(context, AboutUs.ROUTE_NAME);
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
      );
  }
}