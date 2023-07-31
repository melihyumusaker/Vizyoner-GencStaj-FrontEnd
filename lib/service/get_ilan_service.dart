import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/IlanModel.dart';

class IlanService {
  final String url = "http://10.100.72.57:8080/ilanlar";

  Future<List<IlanModel>> fetchIlanList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => IlanModel.fromJson(json)).toList();
    } else {
      throw Exception(
          'HTTP isteği başarısız oldu. Status kod: ${response.statusCode}');
    }
  }
}
