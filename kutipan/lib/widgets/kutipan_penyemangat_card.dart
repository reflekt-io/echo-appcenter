// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:kutipan/models/kutipan_penyemangat.dart';

class KutipanPenyemangatCard extends StatelessWidget {
  final Kutipan_Penyemangat kutipan_penyemangat;
  const KutipanPenyemangatCard(this.kutipan_penyemangat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              backgroundColor: Colors.white12,
              // Judul
              title: Text(
                kutipan_penyemangat.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const SizedBox(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Kutipan : ' + kutipan_penyemangat.kutipan,
                          style:
                              TextStyle(color: Colors.black87.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
