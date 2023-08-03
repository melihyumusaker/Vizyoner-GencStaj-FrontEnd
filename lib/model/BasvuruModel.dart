import 'package:proje/model/IlanModel.dart';
import 'package:proje/model/KullaniciModel.dart';

class BasvuruModel {
  int? basvuruId;
  KullaniciModel? kullanici;
  IlanModel? ilan;

  BasvuruModel({this.basvuruId, this.kullanici, this.ilan});

  BasvuruModel.fromJson(Map<String, dynamic> json) {
    basvuruId = json['basvuru_id'];
    kullanici = json['kullanici'] != null
        ? new KullaniciModel.fromJson(json['kullanici'])
        : null;
    ilan = json['ilan'] != null ? new IlanModel.fromJson(json['ilan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basvuru_id'] = this.basvuruId;
    if (this.kullanici != null) {
      data['kullanici'] = this.kullanici!.toJson();
    }
    if (this.ilan != null) {
      data['ilan'] = this.ilan!.toJson();
    }
    return data;
  }
}
