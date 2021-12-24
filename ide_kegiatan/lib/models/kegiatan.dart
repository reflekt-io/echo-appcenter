class Kegiatan {
  final dynamic user;
  final DateTime date;
  final String nama;
  final String deskripsi;

  const Kegiatan({
    required this.user,
    required this.date,
    required this.nama,
    required this.deskripsi,
  });

  factory Kegiatan.fromJson(Map<String, dynamic> json) => Kegiatan(
        user: json["fields"]["user"],
        date: DateTime.parse(json["fields"]["date"]),
        nama: json["fields"]["nama"],
        deskripsi: json["fields"]["deskripsi"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "date": date.toIso8601String(),
        "nama": nama,
        "deskripsi": deskripsi,
      };
}
