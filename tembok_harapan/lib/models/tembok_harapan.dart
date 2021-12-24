import 'dart:convert';
// To parse this JSON data, do
//

// ignore: camel_case_types
class Tembok_Harapan {
  Tembok_Harapan({
    required this.title,
    required this.harapan,
  });

  final String title;
  final String harapan;

  factory Tembok_Harapan.fromJson(String str) =>
      Tembok_Harapan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tembok_Harapan.fromMap(Map<String, dynamic> json) => Tembok_Harapan(
        title: json["title"],
        harapan: json["harapan"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "harapan": harapan,
      };
}