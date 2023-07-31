import 'package:proje/model/SirketModel.dart';

class KullaniciModel {
  int? kullaniciId;
  String? ad;
  String? soyad;
  String? email;
  String? sifre;
  String? dogumTarihi;
  String? fotograf;
  SirketModel? sirket;
  String? cinsiyet;
  String? adres;

  KullaniciModel(
      {this.kullaniciId,
      this.ad,
      this.soyad,
      this.email,
      this.sifre,
      this.dogumTarihi,
      this.fotograf,
      this.sirket,
      this.cinsiyet,
      this.adres});

  KullaniciModel.fromJson(Map<String, dynamic> json) {
    kullaniciId = json['kullaniciId'];
    ad = json['ad'];
    soyad = json['soyad'];
    email = json['email'];
    sifre = json['sifre'];
    dogumTarihi = json['dogum_tarihi'];
    fotograf = json['fotograf'];
    sirket = json['sirket'] != null
        ? new SirketModel.fromJson(json['sirket'])
        : null;
    cinsiyet = json['cinsiyet'];
    adres = json['adres'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kullaniciId'] = this.kullaniciId;
    data['ad'] = this.ad;
    data['soyad'] = this.soyad;
    data['email'] = this.email;
    data['sifre'] = this.sifre;
    data['dogum_tarihi'] = this.dogumTarihi;
    data['fotograf'] = this.fotograf;
    if (this.sirket != null) {
      data['sirket'] = this.sirket!.toJson();
    }
    data['cinsiyet'] = this.cinsiyet;
    data['adres'] = this.adres;
    return data;
  }
}