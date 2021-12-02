import 'dart:convert';

import 'package:kutipan/models/kutipan_penyemangat.dart';

class Kutipan_PenyemangatJson {
  // pk -> primary key from serialization

  Kutipan_PenyemangatJson({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final List<Kutipan_Penyemangat> fields;

  factory Kutipan_PenyemangatJson.fromJson(String str) =>
      Kutipan_PenyemangatJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kutipan_PenyemangatJson.fromMap(Map<String, dynamic> json) =>
      Kutipan_PenyemangatJson(
        model: json["model"],
        pk: json["pk"],
        fields: List<Kutipan_Penyemangat>.from(json["fields"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "pk": pk,
        "fields": List<dynamic>.from(fields.map((x) => x)),
      };
}
