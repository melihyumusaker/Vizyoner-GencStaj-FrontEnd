import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/KullaniciModel.dart';

class GetUserService {
  Future<KullaniciModel> getOneUserByEmail(String email) async {
    final response = await http


        .get(Uri.parse('http://192.168.150.130:8080/users/email/$email'));



    if (response.statusCode == 200) {
      // İstek başarılı oldu, JSON'dan bir Kullanici nesnesi oluşturup döndürelim.
      return KullaniciModel.fromJson(json.decode(response.body));
    } else {
      // İstek başarısız oldu, hata mesajını yazdıralım veya isteğe uygun bir şekilde işleyelim.
      throw Exception('Kullanıcı getirilemedi: ${response.statusCode}');
    }
  }
}
