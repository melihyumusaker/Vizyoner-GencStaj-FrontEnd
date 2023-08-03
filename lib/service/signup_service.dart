import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proje/model/KullaniciModel.dart';

class SignupService {
  static Future<void> sendDataToServer(
    String ad,
    String soyad,
    String email,
    String sifre,
  ) async {
    final url = Uri.parse('http://192.168.150.39:8080/users');

    final kullaniciModel = KullaniciModel(
      ad: ad,
      soyad: soyad,
      email: email,
      sifre: sifre,
    );

    final jsonData = kullaniciModel.toJson();

    try {
      final response = await http.post(
        url,
        body: jsonEncode(jsonData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Success: Data sent successfully
        print('Data sent successfully.');
      } else {
        // Error: Failed to send data
        print('Failed to send data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
