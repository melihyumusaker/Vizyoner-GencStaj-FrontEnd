import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/BasvuruModel.dart';

class GetBasvuruService {
  Future<List<BasvuruModel>> getAllBasvuruByKullaniciId(int kullaniciId) async {
    final String baseUrl = 'http://192.168.150.39:8080/basvuru/$kullaniciId';

    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // If the request is successful, parse the response body and return the list of BasvuruModel
        List<dynamic> responseData = json.decode(response.body);
        List<BasvuruModel> basvuruList =
            responseData.map((data) => BasvuruModel.fromJson(data)).toList();
        return basvuruList;
      } else {
        print('Failed to fetch basvuru list: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error while fetching basvuru list: $e');
      return [];
    }
  }
}
