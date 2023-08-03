import 'package:proje/model/KullaniciModel.dart';

class EgitimModel {
  int? egitimId;
  String? okul;
  double? ortalama;
  String? sinif;
  String? fakulte;
  String? bolum;
  String? hakkinda;
  KullaniciModel? kullanici;

  EgitimModel({
    this.egitimId,
    this.okul,
    this.ortalama,
    this.sinif,
    this.fakulte,
    this.bolum,
    this.hakkinda,
    this.kullanici,
  });

  factory EgitimModel.fromJson(Map<String, dynamic> json) {
    return EgitimModel(
      egitimId: json['egitim_id'],
      okul: json['okul'],
      ortalama: json['ortalama']?.toDouble(),
      sinif: json['sinif'],
      fakulte: json['fakulte'],
      bolum: json['bolum'],
      hakkinda: json['hakkinda'],
      kullanici: KullaniciModel.fromJson(json['kullanici']),
    );
  }
}
