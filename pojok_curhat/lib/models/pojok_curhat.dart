import 'dart:convert';
// To parse this JSON data, do
//
//     final Pojok_Curhat = Pojok_CurhatFromMap(jsonString);

// ignore: camel_case_types
class Pojok_Curhat {
  Pojok_Curhat({
    required this.name,
    required this.title,
    required this.message,
  });

  final String name;
  final String title;
  final String message;

  factory Pojok_Curhat.fromRawJson(String str) => Pojok_Curhat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pojok_Curhat.fromJson(Map<String, dynamic> json) => Pojok_Curhat(
        name: json["fields"]["id"],
        title: json["fields"]["title"],
        message: json["fields"]["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "message": message,
      };
}
