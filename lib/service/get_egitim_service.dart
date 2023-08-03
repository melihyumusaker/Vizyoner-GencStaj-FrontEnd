import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/EgitimModel.dart';

class GetEgitimService {
  Future<EgitimModel> getEgitimBilgileri(int kullaniciId) async {
    final response = await http
        .get(Uri.parse('http://192.168.150.39:8080/egitim/$kullaniciId'));

    if (response.statusCode == 200) {
      return EgitimModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "Egitim Bilgileri Getirilemedi.. , ${response.statusCode}");
    }
  }
}
