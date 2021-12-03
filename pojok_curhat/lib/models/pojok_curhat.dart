import 'dart:convert';
// To parse this JSON data, do
//
//     final Pojok_Curhat = Pojok_CurhatFromMap(jsonString);

// ignore: camel_case_types
class Pojok_Curhat {
  Pojok_Curhat({
    required this.id,
    required this.title,
    required this.message,
  });

  final String id;
  final String title;
  final String message;

  factory Pojok_Curhat.fromJson(String str) =>
      Pojok_Curhat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pojok_Curhat.fromMap(Map<String, dynamic> json) => Pojok_Curhat(
        id: json["id"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
      };
}
