import 'package:flutter/material.dart';
import 'package:pojok_curhat/models/pojok_curhat.dart';

class PojokCurhatCard extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Pojok_Curhat pojok_curhat;
  const PojokCurhatCard(this.pojok_curhat, {Key? key}) : super(key: key);

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
              // Judul
              title: Text(
                pojok_curhat.title,
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
                          'Dibuat oleh ' + pojok_curhat.name,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Pesan : ' + pojok_curhat.message,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
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
