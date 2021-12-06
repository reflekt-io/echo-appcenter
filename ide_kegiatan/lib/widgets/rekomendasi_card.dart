import 'package:flutter/material.dart';
import 'package:ide_kegiatan/models/rekomendasi.dart';

class RekomendasiCard extends StatelessWidget {
  final Rekomendasi rekomendasi;

  const RekomendasiCard(this.rekomendasi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(title: Text(rekomendasi.nama.toString())),
          ],
        ),
      ),
    );
  }
}
