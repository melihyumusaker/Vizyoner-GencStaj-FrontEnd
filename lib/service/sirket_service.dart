import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proje/model/SirketModel.dart';

class SirketService {
  final String url = "http://192.168.150.130:8080/sirketler";

  Future<List<SirketModel>> fetchSirketList() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => SirketModel.fromJson(json)).toList();
    }else{
      throw  Exception('HTTP isteği başarısız oldu. Status kod: ${response.statusCode}');
    }
  }
}
