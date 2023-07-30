import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {

  Future<Kullanici> getOneUserByEmail(String email) async {

    final response = await http.get(Uri.parse('http://192.168.1.82:8080/users/email/$email'));

    if (response.statusCode == 200) {
      // İstek başarılı oldu, JSON'dan bir Kullanici nesnesi oluşturup döndürelim.
      return Kullanici.fromJson(json.decode(response.body));
    } else {
      // İstek başarısız oldu, hata mesajını yazdıralım veya isteğe uygun bir şekilde işleyelim.
      throw Exception('Kullanıcı getirilemedi: ${response.statusCode}');
    }
  }
}

class Kullanici {
  final String name;
  final String email;
  // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz.

  Kullanici({required this.name, required this.email});

  factory Kullanici.fromJson(Map<String, dynamic> json) {
    return Kullanici(
      name: json['name'],
      email: json['email'],
      // Diğer kullanıcı bilgilerini json'dan çekerek doldurabilirsiniz.
    );
  }
}
