// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tembok_harapan/models/tembok_harapan.dart';

class TembokHarapanCard extends StatelessWidget {
  final Tembok_Harapan tembok_harapan;
  const TembokHarapanCard(this.tembok_harapan, {Key? key}) : super(key: key);

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
                tembok_harapan.title,
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
                          'Harapan : ' + tembok_harapan.harapan,
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
