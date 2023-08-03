import 'dart:developer';

import "package:http/http.dart" as http;

import '../model/BasvuruModel.dart';

class BasvuruService {
  static Future<int> saveBasvuru(BasvuruModel basvuru) async {
    try {
      final Map<String, String> headers = {"Connection": "keep-alive"};
      log(basvuru.kullanici!.kullaniciId.toString());
      log(basvuru.ilan!.ilanId.toString());

      final request = http.Request(
        "POST",
        Uri.parse("http://192.168.150.20:8080/basvuru"),
      );

      request.headers.addAll(headers);

      final response = await http.post(
          Uri.parse("http://192.168.150.20:8080/basvuru"),
          headers: headers,
          body: {
            "kullaniciId": basvuru.kullanici!.kullaniciId,
            "ilan_id": basvuru.ilan!.ilanId
          });

      if (response.statusCode == 200) {
        /**
         *  final responseBody = await response.stream.bytesToString();

        final Map<String, dynamic> parsedJson = jsonDecode(responseBody);

        final int basvuruId = parsedJson['basvuru_id'];

        return basvuruId;
         */

        return 4;
      } else {
        throw Exception('Failed to save Basvuru.');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to save Basvuru.');
    }
  }
}

/**
 * class BasvuruService {
  static saveBasvuru(BasvuruModel basvuru) async {
    try {
      if (basvuru.kullanici == null || basvuru.ilan == null) {
        log("Kullanıcı veya ilan bilgisi eksik.");
        return; // veya hata işleme yapabilirsiniz
      }

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // Null kontrolü yaparak varsayılan değer atıyoruz (örn. 0) ya da hata işleme yapabilirsiniz.
      int kullaniciId = basvuru.kullanici!.kullaniciId ?? 1;
      int ilanId = basvuru.ilan!.ilanId ?? 1;

      final Map<String, dynamic> body = {
        "kullaniciId": basvuru.kullanici?.kullaniciId,
        "ilan_id": basvuru.ilan?.ilanId,
      };

      log(kullaniciId.toString());
      log(ilanId.toString());

      final response = await http.post(
        Uri.parse("http://192.168.150.20:8080/basvuru"),
        body: body,
        headers: headers,
      );

      return int.parse(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
 */