import 'package:proje/model/SirketModel.dart';

class IlanModel {
  int? ilanId;
  SirketModel? sirket;
  String? ilanMetni;
  String? yayinTarihi;
  int? gorulduSayaci;
  String? ilanTuru;
  String? ilanSinifi;
  String? ilanBaslG;
  int? basvuruSayisi;
  String? bitisTarihi;
  String? resim;

  IlanModel({
    this.ilanId,
    this.sirket,
    this.ilanMetni,
    this.yayinTarihi,
    this.gorulduSayaci,
    this.ilanTuru,
    this.ilanSinifi,
    this.ilanBaslG,
    this.basvuruSayisi,
    this.bitisTarihi,
    this.resim,
  });

  IlanModel.fromJson(Map<String, dynamic> json) {
    ilanId = json['ilan_id'];
    sirket =
        json['sirket'] != null ? SirketModel.fromJson(json['sirket']) : null;
    ilanMetni = json['ilan_metni'];
    yayinTarihi = json['yayin_tarihi'];
    gorulduSayaci = json['goruldu_sayaci'];
    ilanTuru = json['ilan_turu'];
    ilanSinifi = json['ilan_sinifi'];
    ilanBaslG = json['ilan_baslÄ±gÄ±'];
    basvuruSayisi = json['basvuru_sayisi'];
    bitisTarihi = json['bitis_tarihi'];
    resim = json['resim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ilan_id'] = this.ilanId;
    if (this.sirket != null) {
      data['sirket'] =
          this.sirket!.toJson(); // Use toJson method of SirketModel
    }
    data['ilan_metni'] = this.ilanMetni;
    data['yayin_tarihi'] = this.yayinTarihi;
    data['goruldu_sayaci'] = this.gorulduSayaci;
    data['ilan_turu'] = this.ilanTuru;
    data['ilan_sinifi'] = this.ilanSinifi;
    data['ilan_baslıgı'] = this.ilanBaslG;
    data['basvuru_sayisi'] = this.basvuruSayisi;
    data['bitis_tarihi'] = this.bitisTarihi;
    data['resim'] = this.resim;
    return data;
  }
}
