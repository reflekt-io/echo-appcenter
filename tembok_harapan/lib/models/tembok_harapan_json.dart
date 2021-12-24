import 'dart:convert';

import 'package:tembok_harapan/models/tembok_harapan.dart';

// ignore: camel_case_types
class Tembok_HarapanJson {
  // pk -> primary key from serialization

  Tembok_HarapanJson({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final String model;
  final int pk;
  final List<Tembok_Harapan> fields;

  factory Tembok_HarapanJson.fromJson(String str) =>
      Tembok_HarapanJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tembok_HarapanJson.fromMap(Map<String, dynamic> json) =>
      Tembok_HarapanJson(
        model: json["model"],
        pk: json["pk"],
        fields: List<Tembok_Harapan>.from(json["fields"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "model": model,
        "pk": pk,
        "fields": List<dynamic>.from(fields.map((x) => x)),
      };
}