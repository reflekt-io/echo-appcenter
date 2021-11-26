// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddJournalPage extends StatefulWidget {
  const AddJournalPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<AddJournalPage> createState() => _JournalHomePageState();
}

class _JournalHomePageState extends State<AddJournalPage> {
  final _formKey = GlobalKey<FormState>();
  final _anxietyScale = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final Map _feelingList = {
    'antusias': 'Antusias',
    'gembira': 'Gembira',
    'takjub': 'Takjub',
    'semangat': 'Semangat',
    'bangga': 'Bangga',
    'penuh_cinta': 'Penuh Cinta',
    'santai': 'Santai',
    'tenang': 'Tenang',
    'puas': 'Puas',
    'lega': 'Lega',
    'marah': 'Marah',
    'takut': 'Takut',
    'stres': 'Stres',
    'waspada': 'Waspada',
    'kewalahan': 'Kewalahan',
    'kesal': 'Kesal',
    'malu': 'Malu',
    'cemas': 'Cemas',
    'lesu': 'Lesu',
    'sedih': 'Sedih',
    'duka': 'Duka',
    'bosan': 'Bosan',
    'kesepian': 'Kesepian',
    'bingung': 'Bingung',
  };
  final Map _factorList = {
    'keluarga': 'Keluarga',
    'pekerjaan': 'Pekerjaan',
    'teman': 'Teman',
    'percintaan': 'Percintaan',
    'kesehatan': 'Kesehatan',
    'pendidikan': 'Pendidikan',
    'tidur': 'Tidur',
    'perjalanan': 'Perjalanan',
    'bersantai': 'Bersantai',
    'makanan': 'Makanan',
    'olahraga': 'Olahraga',
    'seni': 'Seni',
    'hobi': 'Hobi',
    'cuaca': 'Cuaca',
    'belanja': 'Belanja',
    'hiburan': 'Hiburan',
    'keuangan': 'Keuangan',
    'ibadah': 'Ibadah',
    'refleksi_diri': 'Refleksi Diri',
  };
  // Saved variables to be submitted
  int _currentSelectedAnxietyRate = 0;
  List<MapEntry<String, String>> _selectedFeelings = [];
  List<MapEntry<String, String>> _selectedFactors = [];
  String _typedSummary = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurnal Baru'),
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
                    'Bagaimana harimu?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // https://pub.dev/packages/multi_select_flutter
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MultiSelectDialogField(
                    buttonText: const Text('Perasaan apa saja yang sedang kamu rasakan?'),
                    title: const Text('Perasaan'),
                    items: _feelingList.entries
                        .map((MapEntry e) => MultiSelectItem<dynamic?>(e, e.value))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      // TODO: Another exception was thrown
                      // Expected a value of type 'MapEntry<String, String>', but got one of type 'MapEntry<dynamic, dynamic>'
                      setState(() {
                        for (var element in values) {
                          _selectedFeelings.add(element as MapEntry<String, String>);
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MultiSelectDialogField(
                    buttonText: const Text('Dari mana datangnya perasaan tersebut?'),
                    title: const Text('Faktor'),
                    items: _factorList.entries
                        .map((MapEntry e) => MultiSelectItem<dynamic?>(e, e.value))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      // TODO: Another exception was thrown
                      // Expected a value of type 'MapEntry<String, String>', but got one of type 'MapEntry<dynamic, dynamic>'
                      setState(() {
                        for (var element in values) {
                          _selectedFactors.add(element as MapEntry<String, String>);
                        }
                      });
                    },
                  ),
                ),
                // Wrap(
                //   alignment: WrapAlignment.spaceEvenly,
                //   children: _buildButtonsList(_feelingList),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.add_reaction),
                      hintText: 'Seberapa cemaskah kamu?',
                      labelText: 'Tingkat Kecemasan',
                    ),
                    value: _currentSelectedAnxietyRate,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _currentSelectedAnxietyRate = value as int;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _currentSelectedAnxietyRate = value as int;
                      });
                    },
                    items: _anxietyScale.map((int val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val.toString(),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.sticky_note_2),
                      hintText: 'Ayo sini, ceritakan harimu.',
                      labelText: 'Ringkasan',
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _typedSummary = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _typedSummary = value!;
                      });
                    },
                    validator: (String? value) {
                      return (value == null || value.isEmpty)
                          ? 'Ringkasan tidak boleh kosong.'
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
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF0B36A8)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      // Kalau validated, print ringkasan di console (untuk event)
                      else {
                        // ignore: avoid_print
                        print(_typedSummary);
                      }
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

  List<Widget> _buildButtonsList(Map nameList) {
    List<TextButton> buttonsList = <TextButton>[];
    for (String i in nameList.keys) {
      buttonsList.add(
        TextButton(
          child: Text(nameList[i]),
          onPressed: null, // Nanti store yang i aja, terus submit ke database
        ),
      );
    }
    return buttonsList;
  }
}
