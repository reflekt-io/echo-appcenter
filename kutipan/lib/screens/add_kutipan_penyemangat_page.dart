// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class AddKutipanPenyemangatPage extends StatefulWidget {
  const AddKutipanPenyemangatPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<AddKutipanPenyemangatPage> createState() => _Kutipan_PenyemangatHomePageState();
}

class _Kutipan_PenyemangatHomePageState extends State<AddKutipanPenyemangatPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambahkan Kutipan'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Kutipan Penyemangat',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // https://pub.dev/packages/multi_select_flutter

                // Wrap(
                //   alignment: WrapAlignment.spaceEvenly,
                //   children: _buildButtonsList(_feelingList),
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_circle_rounded),
                      hintText: 'Masukin nama kamu (boleh anonim juga :D)',
                      labelText: 'Nama',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Nama tidak boleh kosong.'
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.sticky_note_2),
                      hintText: 'Yuk, tambahin lagi kutipan penyemangatnya',
                      labelText: 'Kutipan',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Kutipannya tidak boleh kosong.'
                          : null;
                    },
                  ),
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
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
