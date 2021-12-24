class Rekomendasi {
  final String nama;

  const Rekomendasi({
    required this.nama,
  });

  factory Rekomendasi.fromJson(Map<String, dynamic> json) => Rekomendasi(
        nama: json["fields"]["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}
