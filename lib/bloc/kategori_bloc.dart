import 'dart:convert';
import 'package:bangkode/helpers/api.dart';
import 'package:bangkode/helpers/api_url.dart';
import 'package:bangkode/model/kategori.dart';

class KategoriBloc {
  static Future<List<Kategori>> getKategoris() async {
    String apiUrl = ApiUrl.baseUrl;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listKategori = (jsonObj as Map<String, dynamic>)['data'];
    List<Kategori> kategoris = [];
    for (int i = 0; i < listKategori.length; i++) {
      kategoris.add(Kategori.fromJson(listKategori[i]));
    }
    return kategoris;
  }
}
