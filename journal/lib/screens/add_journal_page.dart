// ignore_for_file: unnecessary_question_mark, prefer_final_fields, unused_field, unused_element, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:journal/models/option.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddJournalPage extends StatefulWidget {
  const AddJournalPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/add-journal';

  @override
  State<AddJournalPage> createState() => _JournalHomePageState();
}

class _JournalHomePageState extends State<AddJournalPage> {
  final _formKey = GlobalKey<FormState>();
  final _anxietyScale = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<Option> _feelingList = [
    Option(key: 'antusias', value: 'Antusias'),
    Option(key: 'gembira', value: 'Gembira'),
    Option(key: 'takjub', value: 'Takjub'),
    Option(key: 'semangat', value: 'Semangat'),
    Option(key: 'bangga', value: 'Bangga'),
    Option(key: 'penuh_cinta', value: 'Penuh Cinta'),
    Option(key: 'santai', value: 'Santai'),
    Option(key: 'tenang', value: 'Tenang'),
    Option(key: 'puas', value: 'Puas'),
    Option(key: 'lega', value: 'Lega'),
    Option(key: 'marah', value: 'Marah'),
    Option(key: 'takut', value: 'Takut'),
    Option(key: 'stres', value: 'Stres'),
    Option(key: 'waspada', value: 'Waspada'),
    Option(key: 'kewalahan', value: 'Kewalahan'),
    Option(key: 'kesal', value: 'Kesal'),
    Option(key: 'malu', value: 'Malu'),
    Option(key: 'cemas', value: 'Cemas'),
    Option(key: 'lesu', value: 'Lesu'),
    Option(key: 'sedih', value: 'Sedih'),
    Option(key: 'duka', value: 'Duka'),
    Option(key: 'bosan', value: 'Bosan'),
    Option(key: 'kesepian', value: 'Kesepian'),
    Option(key: 'bingung', value: 'Bingung'),
  ];
  final List<Option> _factorList = [
    Option(key: 'keluarga', value: 'Keluarga'),
    Option(key: 'pekerjaan', value: 'Pekerjaan'),
    Option(key: 'teman', value: 'Teman'),
    Option(key: 'percintaan', value: 'Percintaan'),
    Option(key: 'kesehatan', value: 'Kesehatan'),
    Option(key: 'pendidikan', value: 'Pendidikan'),
    Option(key: 'tidur', value: 'Tidur'),
    Option(key: 'perjalanan', value: 'Perjalanan'),
    Option(key: 'bersantai', value: 'Bersantai'),
    Option(key: 'makanan', value: 'Makanan'),
    Option(key: 'olahraga', value: 'Olahraga'),
    Option(key: 'seni', value: 'Seni'),
    Option(key: 'hobi', value: 'Hobi'),
    Option(key: 'cuaca', value: 'Cuaca'),
    Option(key: 'belanja', value: 'Belanja'),
    Option(key: 'hiburan', value: 'Hiburan'),
    Option(key: 'keuangan', value: 'Keuangan'),
    Option(key: 'ibadah', value: 'Ibadah'),
    Option(key: 'refleksi_diri', value: 'Refleksi Diri'),
  ];
  // Saved variables to be submitted
  int _currentSelectedAnxietyRate = 0;
  List _selectedFeelings = [];
  List _selectedFactors = [];
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
                    items: _feelingList
                        .map((option) => MultiSelectItem<Option?>(option, option.value))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      setState(() {
                        _selectedFeelings = values;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (values) {
                      return (values == null || values.isEmpty)
                          ? 'Perasaan tidak boleh kosong.'
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MultiSelectDialogField(
                    buttonText: const Text('Dari mana datangnya perasaan tersebut?'),
                    title: const Text('Faktor'),
                    items: _factorList
                        .map((option) => MultiSelectItem<Option?>(option, option.value))
                        .toList(),
                    listType: MultiSelectListType.CHIP,
                    onConfirm: (values) {
                      setState(() {
                        _selectedFactors = values;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (values) {
                      return (values == null || values.isEmpty)
                          ? 'Faktor perasaan tidak boleh kosong.'
                          : null;
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      if (_formKey.currentState!.validate()) {
                        // How to submit?
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
