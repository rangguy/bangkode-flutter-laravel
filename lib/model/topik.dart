class Topik {
  int? id_topik;
  int? id_kategori;
  String? nama_topik;
  String? logo_topik;

  Topik({this.id_topik, this.id_kategori, this.nama_topik, this.logo_topik});

  factory Topik.fromJson(Map<String, dynamic> obj) {
    return Topik(
      id_topik: obj['id_topik'],
      id_kategori: obj['id_kategori'],
      nama_topik: obj['nama_topik'],
      logo_topik: obj['logo_topik'],
    );
  }
}
