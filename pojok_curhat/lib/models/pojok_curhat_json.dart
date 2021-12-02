import 'dart:convert';

import 'package:pojok_curhat/models/pojok_curhat.dart';

// ignore: camel_case_types
class Pojok_CurhatJson {
  // pk -> primary key from serialization

  Pojok_CurhatJson({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final List<Pojok_Curhat> fields;

  factory Pojok_CurhatJson.fromJson(String str) =>
      Pojok_CurhatJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pojok_CurhatJson.fromMap(Map<String, dynamic> json) =>
      Pojok_CurhatJson(
        model: json["model"],
        pk: json["pk"],
        fields: List<Pojok_Curhat>.from(json["fields"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "pk": pk,
        "fields": List<dynamic>.from(fields.map((x) => x)),
      };
}
