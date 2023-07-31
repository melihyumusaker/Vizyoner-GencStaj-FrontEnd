import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/EtkinlikModel.dart';

class EtkinlikService {
  final String url = "http://10.100.72.57:8080/etkinlikler";
  Future<List<EtkinlikModel>> fetchEtkinlikList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => EtkinlikModel.fromJson(json)).toList();
    } else {
      throw Exception(
          'HTTP isteği başarısız oldu. Status kod: ${response.statusCode}');
    }
  }
}
