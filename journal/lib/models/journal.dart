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

    final dynamic user;
    final DateTime date;
    final String feeling;
    final String factor;
    final int anxietyRate;
    final String summary;

    factory Journal.fromRawJson(String str) => Journal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        user: json["fields"]["user"],
        date: DateTime.parse(json["fields"]["date"]),
        feeling: json["fields"]["feeling"],
        factor: json["fields"]["factor"],
        anxietyRate: json["fields"]["anxiety_rate"],
        summary: json["fields"]["summary"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": date.toIso8601String(),
        "feeling": feeling,
        "factor": factor,
        "anxiety_rate": anxietyRate,
        "summary": summary,
    };
}
