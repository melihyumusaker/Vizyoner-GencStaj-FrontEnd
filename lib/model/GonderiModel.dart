import 'package:proje/model/KullaniciModel.dart';

class GonderiModel {
  int? gonderiId;
  KullaniciModel? kullanici;
  String? icerik;
  DateTime? tarih;
  int? sayacBegeni;
  int? sayacYorum;
  String? fotografGonderi;

  GonderiModel(
      {this.gonderiId,
      this.kullanici,
      this.icerik,
      this.tarih,
      this.sayacBegeni,
      this.sayacYorum,
      this.fotografGonderi});

  GonderiModel.fromJson(Map<String, dynamic> json) {
    gonderiId = json['gonderiId'];
    kullanici = json['kullanici'] != null
        ? new KullaniciModel.fromJson(json['kullanici'])
        : null;
    icerik = json['icerik'];
    tarih = json['tarih'];
    sayacBegeni = json['sayacBegeni'];
    sayacYorum = json['sayacYorum'];
    fotografGonderi = json['fotografGonderi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gonderiId'] = this.gonderiId;
    if (this.kullanici != null) {
      data['kullanici'] = this.kullanici!.toJson();
    }
    data['icerik'] = this.icerik;
    data['tarih'] = this.tarih;
    data['sayacBegeni'] = this.sayacBegeni;
    data['sayacYorum'] = this.sayacYorum;
    data['fotografGonderi'] = this.fotografGonderi;
    return data;
  }
}