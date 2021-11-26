import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_json.dart';

// ignore: non_constant_identifier_names
JournalJson DUMMY_CATEGORIES = JournalJson(
  model: 'journal.journal',
  pk: 1,
  fields: [
    Journal(
      user: 1,
      date: DateTime.parse('2021-11-13T09:50:25.151Z'),
      feeling: 'marah,takut,stres,waspada,kewalahan,kesal,cemas,lesu,bosan,bingung',
      factor: 'pekerjaan,teman,pendidikan',
      anxietyRate: 9,
      summary: 'Aku sayang kesehatan mentalku :(',
    ),
    Journal(
      user: 1,
      date: DateTime.parse('2021-11-13T07:45:13.151Z'),
      feeling: 'lega',
      factor: 'makanan',
      anxietyRate: 4,
      summary: 'Enak banget makan :D',
    ),
    Journal(
      user: 1,
      date: DateTime.parse('2021-11-13T05:59:59.151Z'),
      feeling: 'antusias,gembira,semangat,bangga',
      factor: 'tidur,bersantai,hiburan',
      anxietyRate: 3,
      summary: 'Tidurku nyenyak~',
    )
  ],
);