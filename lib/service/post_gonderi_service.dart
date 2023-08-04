import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/GonderiModel.dart';
import 'package:proje/model/KullaniciModel.dart';

class PostGonderiService {
  final uri = Uri.parse("http://192.168.150.39:8080/post");

  Future<GonderiModel> createdPost(
      String icerik, String fotograf, KullaniciModel kullanici) async {
    Map<String, dynamic> request = {
      'icerik': icerik,
      'fotografGonderi': fotograf,
      'kullaniciId': kullanici.kullaniciId
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(uri, body: jsonEncode(request), headers: headers);

    if (response.statusCode == 200) {
      return GonderiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gonderi Post İslemi Başarısız: ${response.statusCode} ");
    }
  }
}
