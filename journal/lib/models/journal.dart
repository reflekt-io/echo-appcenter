// Generated with https://app.quicktype.io/

// To parse this JSON data, do
//
//     final journal = journalFromMap(jsonString);

import 'dart:convert';

class Journal {
    Journal({
        required this.user,
        required this.date,
        required this.feeling,
        required this.factor,
        required this.anxietyRate,
        required this.summary,
    });

    final int user;
    final DateTime date;
    final String feeling;
    final String factor;
    final int anxietyRate;
    final String summary;

    factory Journal.fromJson(String str) => Journal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Journal.fromMap(Map<String, dynamic> json) => Journal(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        feeling: json["feeling"],
        factor: json["factor"],
        anxietyRate: json["anxiety_rate"],
        summary: json["summary"],
    );

    Map<String, dynamic> toMap() => {
        "user": user,
        "date": date.toIso8601String(),
        "feeling": feeling,
        "factor": factor,
        "anxiety_rate": anxietyRate,
        "summary": summary,
    };
}
