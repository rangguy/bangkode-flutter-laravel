class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static const String registrasi = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String getKategori = '$baseUrl/course';
  static const String getTopik = 'http://10.0.2.2:8000/api/topik';

  static String showTopik(int id_kategori) {
    return '$baseUrl/course/$id_kategori';
  }

  static String showMateri(int id_kategori, int id_topik) {
    return '$baseUrl/course/$id_kategori/$id_topik';
  }
}
