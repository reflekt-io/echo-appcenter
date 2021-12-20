// ignore_for_file: deprecated_member_use, unnecessary_const, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:echo/widgets/drawer_menu.dart';

void main() {
  runApp(const MaterialApp(
    title: "About Us",
    home: AboutUs(),
  ));
}

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/about-us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final _formKey = GlobalKey<FormState>();
  String nama = "";
  String email = "";
  String telepon = "";
  String topik = "";
  String pesan = "";

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
                    "Jurnal kesehatan mental untuk kehidupan yang lebih sehat di masa pandemi.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Kesehatan mental menjadi hal krusial untuk diperhatikan di tengah pandemi COVID-19 yang tak kunjung membaik ini. Kami yakin bahwa hidup terasa semakin sulit dari hari ke hari setelah lebih dari satu tahun hidup di bawah ancaman virus corona dengan interaksi sosial yang terbatas. Dengan adanya keterbatasan ini, semakin banyak orang yang mengalami depresi dan frustasi karena mereka tidak lagi memiliki tempat untuk mencurahkan isi hatinya akibat canggung untuk berinteraksi dengan orang lain. Oleh karena itu, kami membuat aplikasi situs web bernama reflekt.io yang dapat menjadi tempat aman baru bagi semua orang. Aplikasi situs web ini memiliki berbagai fitur dapat membantu menjaga kesehatan mental kita di situasi sulit seperti ini. Kami berharap aplikasi situs web ini dapat membantu orang-orang untuk menjalani hidup dengan lebih mudah di masa pandemi ini.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      color: Color.fromRGBO(20, 51, 51, 1),
                    ),
                  ),
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
                "Hubungi Kami.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    nama = value!;
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
                    telepon = value!;
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Topik pesan tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    topik = value!;
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pesan tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    pesan = value!;
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();

                  if (isValid) {
                    _formKey.currentState!.save();
                    _formKey.currentState!.reset();
                    FocusScope.of(context).unfocus();

                    const message = 'Pesan berhasil dikirim!';
                    const snackBar = const SnackBar(
                      content: Text(
                        message,
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
}
