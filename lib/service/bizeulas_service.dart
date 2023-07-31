import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:proje/model/BizeUlas.dart';

class BizeUlasService {
  final uri = Uri.parse("http://10.100.72.57:8080/bizeulas");

  Future<BizeUlasModel> createPost(String ad, String baslik, String e_mail,
      String icerik, String soyad) async {
    Map<String, dynamic> request = {
      'ad': ad,
      'soyad': soyad,
      'e_mail': e_mail,
      'baslik': baslik,
      'icerik': icerik,
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(uri, body: jsonEncode(request), headers: headers);

    if (response.statusCode == 200) {
      return BizeUlasModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Post İşlemi Başarısız : ${response.statusCode}");
    }
  }
}
