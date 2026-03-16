class Buku {
  int? id;
  String judul;
  String pengarang;
  String tahun;

  Buku({
    this.id,
    required this.judul,
    required this.pengarang,
    required this.tahun,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: json['id'],
      judul: json['judul'],
      pengarang: json['pengarang'],
      tahun: json['tahun'],
    );
  }
}