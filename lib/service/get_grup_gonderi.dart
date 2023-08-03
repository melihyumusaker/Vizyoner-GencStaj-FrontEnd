import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proje/model/GonderiModel.dart';

class GetGrupGonderiService {


  Future<List<GonderiModel>> getGrupGonderileri(List<int> kullaniciIdleri) async {
    final url = Uri.parse('http://192.168.150.20:8080/post/grup-gonderileri')
        .replace(queryParameters: {'kullaniciIdleri': kullaniciIdleri.map((id) => id.toString()).toList()});

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => GonderiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load gonderiler');
    }
  }
}