// ignore_for_file: deprecated_member_use, unnecessary_const, constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:echo/widgets/drawer_menu.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(const MaterialApp(title: "About Us", home: AboutUs()));
}

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/about-us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final _formKey = GlobalKey<FormState>();
  String fullName = "";
  String queryTopic = "";
  String phoneNumber = "";
  String email = "";
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      drawer: const DrawerMenu(AboutUs.ROUTE_NAME),
      body: ListView(children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 20),
          child: Column(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    "Jurnal kesehatan mental untuk kehidupan yang lebih sehat di masa pandemi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    indent: 230,
                    endIndent: 230,
                    color: Color.fromRGBO(11, 53, 168, 1),
                  ),
                  Text(
                    "Kesehatan mental menjadi hal krusial untuk diperhatikan di tengah pandemi COVID-19 yang tak kunjung membaik ini. Kami yakin bahwa hidup terasa semakin sulit dari hari ke hari setelah lebih dari satu tahun hidup di bawah ancaman virus corona dengan interaksi sosial yang terbatas. Dengan adanya keterbatasan ini, semakin banyak orang yang mengalami depresi dan frustasi karena mereka tidak lagi memiliki tempat untuk mencurahkan isi hatinya akibat canggung untuk berinteraksi dengan orang lain. Oleh karena itu, kami membuat aplikasi situs web bernama reflekt.io yang dapat menjadi tempat aman baru bagi semua orang. Aplikasi situs web ini memiliki berbagai fitur dapat membantu menjaga kesehatan mental kita di situasi sulit seperti ini. Kami berharap aplikasi situs web ini dapat membantu orang-orang untuk menjalani hidup dengan lebih mudah di masa pandemi ini.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Exo',
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Fitur-Fitur",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 5,
                    indent: 230,
                    endIndent: 230,
                    color: Color.fromRGBO(11, 53, 168, 1),
                  ),
                  buildCard(
                      "Journaling",
                      "Tempat pribadi bagi pengguna untuk mencurahkan pikiran dan emosi yang mereka rasakan di sepanjang hari.",
                      "Tempat pribadi bagi pengguna untuk mencurahkan pikiran dan emosi yang mereka rasakan di sepanjang hari. Pada fitur ini, pengguna dapat membuat jurnal baru ataupun melihat jurnal yang sudah pernah dibuat."),
                  buildCard(
                      "Ide Kegiatan",
                      "Berisi rekomendasi aktivitas untuk meningkatkan ataupun menjaga kesehatan mental berdasarkan hasil penjurnalan pengguna.",
                      "Berisi rekomendasi aktivitas untuk meningkatkan ataupun menjaga kesehatan mental berdasarkan hasil penjurnalan pengguna. Dengan adanya fitur ini, pengguna akan memiliki solusi sementara terhadap permasalahan yang sedang dihadapi."),
                  buildCard(
                      "Pojok Curhat",
                      "Tempat pribadi bagi pengguna untuk mencurahkan semua pikiran dan emosi yang sedang menghantui mereka.",
                      "Tempat pribadi bagi pengguna untuk mencurahkan semua pikiran dan emosi yang sedang menghantui mereka. Pada fitur ini, pengguna dapat membuat berbagai curhatan dan hasilnya akan ditampilakan dalam bentuk tabel."),
                  buildCard(
                      "Tembok Harapan",
                      "Tempat pribadi bagi pengguna untuk menuliskan semua keinginan yang ingin mereka capai.",
                      "Tempat pribadi bagi pengguna untuk menuliskan semua keinginan yang ingin mereka capai. Fitur ini akan menjadi pengingat sekaligus penyemangat bagi pengguna untuk terus berusaha mencapai segala keinginan mereka."),
                  buildCard(
                      "Kutipan Penyemangat",
                      "Tempat bagi pengguna untuk mengirimkan kutipan penyemangat yang nantinya akan dipublikasikan ke publik.",
                      "Tempat bagi pengguna untuk mengirimkan kutipan penyemangat yang nantinya akan dipublikasikan ke publik. Dengan adanya fitur ini, para pengguna diharapkan dapat saling menguatkan sesamanya agar tetap bisa bertahan di masa sulit ini."),
                  buildCard(
                      "Deteksi Dini Depresi",
                      "Alat yang membantu pengguna untuk mengetahui apakah mereka sedang mengalami depresi atau tidak.",
                      "Alat yang membantu pengguna untuk mengetahui apakah mereka sedang mengalami depresi atau tidak. Fitur ini berisi kuesioner mengenai perilaku dan perasaan pengguna. Hasil kuesioner akan digunakan untuk proses diagnosis.")
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Tim Kami",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    height: 15,
                    thickness: 5,
                    indent: 230,
                    endIndent: 230,
                    color: Color.fromRGBO(11, 53, 168, 1),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/aurel.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Aurelia Amanda Robert",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/kevin.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Kevin",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/loanda.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Loanda Gunawan",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/athal.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Muhammad Athallah",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            AssetImage("assets/images/bintang.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Muhammad Bintang Azriel Aditya Wardhana",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/fikri.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Muhammad Fikri Haryanto",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("assets/images/faiz.jpg"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Teuku Faiz Aryasena",
                        style: TextStyle(fontFamily: 'Exo'),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Hubungi Kami",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 5,
                indent: 260,
                endIndent: 260,
                color: Color.fromRGBO(11, 53, 168, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "contoh: Susilo Bambang",
                    labelText: "Nama Lengkap",
                    icon: const Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    fullName = value!;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "contoh: susilo@mail.com",
                    labelText: "Email",
                    icon: const Icon(Icons.mail),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Masukkan email yang valid!';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    email = value!;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "contoh: 081234567890",
                    labelText: "Nomor Telepon",
                    icon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong';
                    } else if (!RegExp(r"(^(?:[+0]62)?[0-9]{10,15}$)")
                        .hasMatch(value)) {
                      return 'Masukkan nomor telepon yang valid!';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    phoneNumber = value!;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "contoh: Topik",
                    labelText: "Topik Pesan",
                    icon: const Icon(Icons.topic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Topik pesan tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    queryTopic = value!;
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "contoh: The quick brown fox jumps over the lazy dog",
                    labelText: "Pesan",
                    icon: const Icon(Icons.message),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pesan tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    message = value!;
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text(
                  "Kirim Pesan",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(11, 53, 168, 1),
                ),
                onPressed: () async {
                  final isValid = _formKey.currentState!.validate();

                  if (isValid) {
                    _formKey.currentState!.save();

                    final response = await http.post(
                        Uri.parse(
                            "https://reflekt-io.herokuapp.com/about-us/add-contact-flutter"),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'full_name': fullName,
                          'query_topic': queryTopic,
                          'phone_number': phoneNumber,
                          'email': email,
                          'message': message,
                        }));

                    var body = jsonDecode(response.body);
                    String status = body["status"];

                    if (status == "success") {
                      SnackBar snackBar = const SnackBar(
                        content: Text(
                          "Pesan Anda berhasil dikirim!",
                          style: TextStyle(fontSize: 20),
                        ),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SnackBar snackBar = const SnackBar(
                        content: Text(
                          "Terjadi error, silakan coba lagi",
                          style: TextStyle(fontSize: 20),
                        ),
                        backgroundColor: Colors.red,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    _formKey.currentState!.reset();
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ]),
    );
  }

  buildCard(String header, String collapsed, String expanded) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(top: 0, bottom: 0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ExpandablePanel(
            header: Text(header,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.bold)),
            collapsed: Text(collapsed,
                style: const TextStyle(fontSize: 15, fontFamily: 'Exo'),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.fade),
            expanded: Text(expanded,
                style: const TextStyle(fontSize: 15, fontFamily: 'Exo')),
          ),
        ),
      ),
    );
  }
}
