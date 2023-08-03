import 'package:http/http.dart' as http;

class DeleteUserFromDatabase {
  Future<void> deleteUser(int kullaniciId) async {
    final response = await http
        .delete(Uri.parse('http://192.168.150.20:8080/users/$kullaniciId'));

    if (response.statusCode == 200) {
      print("Kullanici Silindi");
    } else {
      print("Kullanici silinirken hata oluştu , ${response.body}");
    }
  }
}
