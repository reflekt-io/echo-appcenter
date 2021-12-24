// ignore_for_file: unused_import, camel_case_types

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

  factory Kutipan_Penyemangat.fromRawJson(String str) => Kutipan_Penyemangat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Kutipan_Penyemangat.fromJson(Map<String, dynamic> json) => Kutipan_Penyemangat(
        nama: json["fields"]["name"],
        kutipan: json["fields"]["quotes_form"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "kutipan": kutipan,
      };
}
