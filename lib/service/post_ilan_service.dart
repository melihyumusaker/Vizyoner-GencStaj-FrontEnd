import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import "package:http/http.dart" as http;
import 'package:http_parser/http_parser.dart';

import '../model/BasvuruModel.dart';

class BasvuruService {
  static Future<int> saveBasvuru(BasvuruModel basvuru) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
      };
      log(basvuru.kullanici!.kullaniciId.toString());
      log(basvuru.ilan!.ilanId.toString());

      Uint8List bytesImageIlan =
          const Base64Decoder().convert(basvuru.ilan!.resim!);
      final imageFile = http.MultipartFile.fromBytes(
        'resim',
        bytesImageIlan,
        filename: 'resim.png',
        contentType: MediaType('image', 'png'),
      );

      final request = http.MultipartRequest(
        "POST",
        Uri.parse("http://192.168.150.20:8080/basvuru"),
      );

      request.headers.addAll(headers);

      request.fields['kullaniciId'] = basvuru.kullanici!.kullaniciId.toString();
      request.fields['ilan_id'] = basvuru.ilan!.ilanId.toString();

      request.files.add(imageFile);

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();

        final Map<String, dynamic> parsedJson = jsonDecode(responseBody);

        final int basvuruId = parsedJson['basvuru_id'];

        return basvuruId;
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