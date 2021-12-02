// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final Kutipan_Penyemangat = Kutipan_PenyemangatFromMap(jsonString);

class Kutipan_Penyemangat {
  Kutipan_Penyemangat({
    required this.nama,
    required this.kutipan,
  });

  final String nama;
  final String kutipan;

  factory Kutipan_Penyemangat.fromJson(String str) =>
      Kutipan_Penyemangat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kutipan_Penyemangat.fromMap(Map<String, dynamic> json) => Kutipan_Penyemangat(
        nama: json["nama"],
        kutipan: json["kutipan"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "kutipan": kutipan,
      };
}
