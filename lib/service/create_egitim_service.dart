import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proje/model/EgitimModel.dart';

class CreateEgitimService {
  Future<void> createEgitim(EgitimModel yeniEgitim) async {
    final String apiUrl = "http://192.168.150.130:8080/egitim/egitim-olustur";

    Map<String, dynamic> egitimData = {
      "okul": yeniEgitim.okul,
      "ortalama": yeniEgitim.ortalama,
      "sinif": yeniEgitim.sinif,
      "bolum": yeniEgitim.bolum,
      "hakkinda": yeniEgitim.hakkinda,
      "kullanici_id": yeniEgitim.kullanici?.kullaniciId,
    };

    String requestBody = json.encode(egitimData);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        // Başarılı kaydetme durumunda yapılacak işlemler
        // Örneğin, kullanıcıya bir bildirim gösterilebilir.
      } else {
        // Hata durumunda kullanıcıya bir hata bildirimi gösterilebilir.
      }
    } catch (error) {
      // Hata durumunda kullanıcıya bir hata bildirimi gösterilebilir.
      print(error);
    }
  }
}
