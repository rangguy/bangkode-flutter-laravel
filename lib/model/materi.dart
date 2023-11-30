class Materi {
  int? id_materi;
  String? judul_materi;
  String? url_materi;
  String? deskripsi_materi;

  Materi({this.id_materi, this.judul_materi, this.url_materi, this.deskripsi_materi});

  factory Materi.fromJson(Map<String, dynamic> obj) {
    return Materi(
      id_materi: obj['id_materi'],
      judul_materi: obj['judul_materi'],
      url_materi: obj['url_materi'],
      deskripsi_materi: obj['deskripsi_materi'],
    );
  }
}
