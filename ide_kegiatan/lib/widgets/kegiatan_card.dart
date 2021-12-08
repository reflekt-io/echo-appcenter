import 'package:flutter/material.dart';
import 'package:ide_kegiatan/models/kegiatan.dart';

class KegiatanCard extends StatelessWidget {
  final Kegiatan kegiatan;

  const KegiatanCard(this.kegiatan, {Key? key}) : super(key: key);

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
            ListTile(
              title: Text(kegiatan.nama.toString()),
              subtitle: Text(kegiatan.deskripsi.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
