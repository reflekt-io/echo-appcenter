// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:echo/screens/home_page.dart';

class PHQ9 extends StatefulWidget {
  const PHQ9({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/deteksi_depresi';

  @override
  State<PHQ9> createState() => _PHQ9State();
}

class _PHQ9State extends State<PHQ9> with RouteAware {

  List<String> questions = [
    "Kurang berminat atau bergairah dalam melakukan apapun",
    "Merasa murung, sedih, atau putus asa",
    "Sulit tidur/mudah terbangun, atau terlalu banyak tidur",
    "Merasa lelah atau kurang bertenaga",
    "Kurang nafsu makan atau terlalu banyak makan",
    "Kurang percaya diri — atau merasa bahwa Anda adalah orang yang gagal atau telah mengecewakan diri sendiri atau keluarga",
    "Sulit berkonsentrasi pada sesuatu, misalnya membaca koran atau menonton televisi",
    "Bergerak atau berbicara sangat lambat sehingga orang lain memperhatikannya. Atau sebaliknya; merasa resah atau gelisah sehingga Anda lebih sering bergerak dari biasanya",
    "Merasa lebih baik mati atau ingin melukai diri sendiri dengan cara apapun"
  ];

  List<Map<String, Object>> choices = [
    {
      'text': 'Tidak pernah',
      'score': 0,
    },
    {
      'text': 'Beberapa hari',
      'score': 1,
    },
    {
      'text': 'Lebih dari seminggu',
      'score': 2,
    },
    {
      'text': 'Hampir setiap hari',
      'score': 3,
    },
  ];

  late List<double> scores = [for (var i = 0; i < questions.length; i++) 0];

  String get resultText {
    String resultText;
    int totalScore = scores.sum as int;
    if (totalScore >= 20) {
      resultText = 'Depresi berat';
    } else if (totalScore >= 15) {
      resultText = 'Depresi sedang';
    } else if (totalScore >= 10) {
      resultText = 'Depresi ringan';
    } else if (totalScore >= 5) {
      resultText = 'Gejala depresi ringan';
    } else {
      resultText = 'Tidak terdapat gejala depresi';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Health Questionnaire (PHQ-9)'),
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
                      Navigator.pushReplacementNamed(
                          context, HomePage.ROUTE_NAME);
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
                        },
                      ),
                      ListTile(
                        title: const Text('Buat Jurnal Baru'),
                        onTap: () {
                          // Go to Jurnal Baru page
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
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Dalam 2 minggu terakhir, seberapa sering Anda terganggu oleh masalah-masalah berikut?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              for (int i = 0; i < questions.length; i++)
              Column(
                children: [
                  const Divider(
                    thickness: 2.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questions[i]),
                  ),
                  Slider(
                    value: scores[i],
                    min: 0,
                    max: 3,
                    divisions: 3,
                    label: '${choices[scores[i].round()]['text']}',
                    onChanged: (value) {
                      setState(() {
                        scores[i] = value;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: TextButton(
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF0B36A8)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Hasil deteksi depresi"),
                          content: Text(resultText),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
