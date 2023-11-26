class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2:8000/api/course';

  // static const String registrasi = '$baseUrl/registrasi';
  // static const String login = '$baseUrl/login';
  // static const String listKategori = '$baseUrl/course';
  // static const String createProduk = '$baseUrl/produk';

  static String showTopik(int id_kategori) {
    return '$baseUrl/$id_kategori';
  }
  
  static String showMateri(int id_kategori, int id_topik) {
    return '$baseUrl/$id_kategori/$id_topik';
  }

  // static String deleteProduk(int id) {
  //   return '$baseUrl/produk/$id';
  // }
}
