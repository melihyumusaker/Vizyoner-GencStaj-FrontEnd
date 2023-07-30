import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> loginKullanici(String email, String sifre) async {
    try {
      // API'ye post request gönder
      final response = await http.post(
        Uri.parse("http://192.168.1.82:8080/users/login"),
        body: {
          'email': email,
          'sifre': sifre,
        },
      );

      // API'den gelen response kontrolü
      if (response.statusCode == 200) {
        // API'den gelen yanıtı çözümle
        final responseBody = json.decode(response.body);

        // API'nin döndüğü true/false değerini döndür
        return responseBody == true;
      } else {
        // Sunucudan geçersiz yanıt alındıysa false döndür
        return false;
      }
    } catch (e) {
      // Hata durumunda false döndür
      debugPrint(e.toString());
      return false;
    }
  }
}
