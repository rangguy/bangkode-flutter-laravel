import 'dart:convert';
import 'package:bangkode/helpers/api.dart';
import 'package:bangkode/helpers/api_url.dart';
import 'package:bangkode/model/materi.dart';

class MateriBloc {
  static Future<List<Materi>> getMateris({int? id_kategori, int? id_topik}) async {
    String apiUrl = ApiUrl.showMateri(id_kategori!, id_topik!);
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listMateri = (jsonObj as Map<String, dynamic>)['data'];
    List<Materi> materis = [];
    for (int i = 0; i < listMateri.length; i++) {
      materis.add(Materi.fromJson(listMateri[i]));
    }
    return materis;
  }
}
