import 'package:proje/model/KullaniciModel.dart';

class GrupModel {
  int? grupId;
  String? grupAdi;
  List<KullaniciModel>? uyeler;
  KullaniciModel? grupOlusturan;
  int? grupMevcut;
  String? grupHakkNda;
  String? olusturulmaTarihi;

  GrupModel(
      {this.grupId,
      this.grupAdi,
      this.uyeler,
      this.grupOlusturan,
      this.grupMevcut,
      this.grupHakkNda,
      this.olusturulmaTarihi});

  GrupModel.fromJson(Map<String, dynamic> json) {
    grupId = json['grup_id'];
    grupAdi = json['grupAdi'];
    if (json['uyeler'] != null) {
      uyeler = <KullaniciModel>[];
      json['uyeler'].forEach((v) {
        uyeler!.add(new KullaniciModel.fromJson(v));
      });
    }
    grupOlusturan = json['grupOlusturan'] != null
        ? new KullaniciModel.fromJson(json['grupOlusturan'])
        : null;
    grupMevcut = json['grup_mevcut'];
    grupHakkNda = json['grup_hakkında'];
    olusturulmaTarihi = json['olusturulma_tarihi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grup_id'] = this.grupId;
    data['grupAdi'] = this.grupAdi;
    if (this.uyeler != null) {
      data['uyeler'] = this.uyeler!.map((v) => v.toJson()).toList();
    }
    if (this.grupOlusturan != null) {
      data['grupOlusturan'] = this.grupOlusturan!.toJson();
    }
    data['grup_mevcut'] = this.grupMevcut;
    data['grup_hakkında'] = this.grupHakkNda;
    data['olusturulma_tarihi'] = this.olusturulmaTarihi;
    return data;
  }
}
