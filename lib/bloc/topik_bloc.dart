import 'dart:convert';
import 'package:bangkode/helpers/api.dart';
import 'package:bangkode/helpers/api_url.dart';
import 'package:bangkode/model/topik.dart';

class TopikBloc {
  static Future<List<Topik>> getTopiks({int? id_kategori}) async {
    String apiUrl = ApiUrl.showTopik(id_kategori!);
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTopik = (jsonObj as Map<String, dynamic>)['data'];
    List<Topik> topiks = [];
    for (int i = 0; i < listTopik.length; i++) {
      topiks.add(Topik.fromJson(listTopik[i]));
    }
    return topiks;
  }
}
