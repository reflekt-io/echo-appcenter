import 'package:flutter/material.dart';
import 'package:journal/models/journal.dart';

// https://stackoverflow.com/questions/56273062/flutter-collapsible-expansible-card
// https://stackoverflow.com/questions/50530152/how-to-create-expandable-listview-in-flutter

class JournalCard extends StatelessWidget {
  final Journal journal;

  const JournalCard(this.journal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            backgroundColor: Colors.white,
            // Tanggal
            title: Text(
              _showDate(journal.date),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const SizedBox(),
            children: [
              // Tingkat Kecemasan
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Tingkat Kecemasan: ' + journal.anxietyRate.toString(),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              // Perasaan
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Perasaan: ' + _showFeelings(journal.feeling),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              // Faktor
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Faktor: ' + _showFactors(journal.factor),
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              // Title Ringkasan
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Ringkasan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              // Ringkasan
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        journal.summary,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _showDate(DateTime rawDate) {
    DateTime dateTime = rawDate.toLocal();
    // ignore: non_constant_identifier_names
    List MONTH = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    // ignore: non_constant_identifier_names
    Map DAY = {
      1: 'Senin',
      2: 'Selasa',
      3: 'Rabu',
      4: 'Kamis',
      5: 'Jumat',
      6: 'Sabtu',
      7: 'Minggu'
    };

    // Example: 2021-11-13T09:50:25.151Z
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;
    String monthName = MONTH[month - 1];
    String dayName = DAY[dateTime.weekday];

    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int second = dateTime.second;

    // Use string interpolation
    String result = '$dayName, $day $monthName $year, pukul $hour.$minute.$second.';

    return result;
  }

  String _showFeelings(String fullFeelings) {
    // ignore: non_constant_identifier_names
    Map FEELINGS = {
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

    List listOfFeelings = fullFeelings.split(',');
    String result = '';

    for (int i = 0;i < listOfFeelings.length;i++) {
      result += FEELINGS[listOfFeelings[i]];
      if (i < listOfFeelings.length-1) {
        result += ', ';
      }
      else {
        result += '.';
      }
    }

    return result;
  }

  String _showFactors(String fullFactors) {
    // ignore: non_constant_identifier_names
    Map FACTORS = {
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

    List listOfFactors = fullFactors.split(',');
    String result = '';

    for (int i = 0;i < listOfFactors.length;i++) {
      result += FACTORS[listOfFactors[i]];
      if (i < listOfFactors.length-1) {
        result += ', ';
      }
      else {
        result += '.';
      }
    }

    return result;
  }
}
