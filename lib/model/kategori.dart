class Kategori {
  int? id_kategori;
  String? nama_kategori;
  String? foto;

  Kategori({this.id_kategori, this.nama_kategori, this.foto});

  factory Kategori.fromJson(Map<String, dynamic> obj) {
    return Kategori(
      id_kategori: obj['id_kategori'],
      nama_kategori: obj['nama_kategori'],
      foto: obj['foto'],
    );
  }
}
