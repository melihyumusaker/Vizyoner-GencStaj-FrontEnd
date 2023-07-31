import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proje/model/BlogModel.dart';
class BlogService{

  final String url ="http://192.168.1.34:8080/bloglar";
  Future<List<BlogModel>> fetchBlogList() async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => BlogModel.fromJson(json)).toList();
    }else{
      throw  Exception('HTTP isteği başarısız oldu. Status kod: ${response.statusCode}');
    }

  }
}