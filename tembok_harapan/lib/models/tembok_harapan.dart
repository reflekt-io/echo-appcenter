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

  factory Tembok_Harapan.fromRawJson(String str) =>
      Tembok_Harapan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tembok_Harapan.fromJson(Map<String, dynamic> json) => Tembok_Harapan(
        title: json["fields"]["title"],
        harapan: json["fields"]["harapan"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "harapan": harapan,
      };

}