import 'dart:convert';
import 'package:http/http.dart' as http;

class LikeService {
  Future<void> likePost(int postId) async {
    final String apiUrl = "http://192.168.150.20:8080/post/$postId/like";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
      );
    } catch (error) {
      // Hata durumunda kullanıcıya bir hata bildirimi gösterilebilir.
      print(error);
    }
  }
}
