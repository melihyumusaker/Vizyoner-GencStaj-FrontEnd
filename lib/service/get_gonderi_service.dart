import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:proje/model/GonderiModel.dart';
import 'package:proje/model/SirketModel.dart';

class GonderiService {

  final String url = "http://192.168.1.41:8080/post";


  Future<List<GonderiModel>> fetchGonderiList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => GonderiModel.fromJson(json)).toList();
    } else {
      throw Exception(
          'HTTP isteği başarısız oldu. Status kod: ${response.statusCode}');
    }
  }
}
