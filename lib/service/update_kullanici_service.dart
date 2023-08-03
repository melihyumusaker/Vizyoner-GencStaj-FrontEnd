import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proje/model/KullaniciModel.dart';

class UpdateKullaniciService {
  Future<void> updateOneUserEmail(String email, KullaniciModel newUser) async {
    final String apiUrl = "http://192.168.150.39:8080/users/email/$email";

    Map<String, dynamic> userData = {
      "adres": newUser.adres,
      "fotograf": newUser.fotograf,
      "dogum_tarihi": newUser.dogumTarihi,
      "cinsiyet": newUser.cinsiyet,
    };

    String requestBody = json.encode(userData);

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: requestBody,
      );
    } catch (error) {
      // Hata durumunda false döndürün
      return print(error);
    }
  }
}
