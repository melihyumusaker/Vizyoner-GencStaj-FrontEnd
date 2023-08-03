import 'dart:convert';

import 'package:proje/model/GrupModel.dart';
import 'package:http/http.dart' as http;

class GetGrupService {
  Future<List<GrupModel>> fetchGrupList() async {
    final response =
        await http.get(Uri.parse("http://192.168.150.39:8080/gruplar"));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);

      return jsonList.map((json) => GrupModel.fromJson(json)).toList();
    } else {
      throw Exception('HTTP isteği başarısız: ${response.statusCode}');
    }
  }
}
