class SirketModel {
  int? sirketId;
  String? sirketAdi;
  String? adres;
  String? sirketAciklamasi;
  String? webSitesi;
  String? logo;

  SirketModel(
      {this.sirketId,
      this.sirketAdi,
      this.adres,
      this.sirketAciklamasi,
      this.webSitesi,
      this.logo});

  SirketModel.fromJson(Map<String, dynamic> json) {
    sirketId = json['sirket_id'];
    sirketAdi = json['sirket_adi'];
    adres = json['adres'];
    sirketAciklamasi = json['sirket_aciklamasi'];
    webSitesi = json['web_sitesi'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sirket_id'] = this.sirketId;
    data['sirket_adi'] = this.sirketAdi;
    data['adres'] = this.adres;
    data['sirket_aciklamasi'] = this.sirketAciklamasi;
    data['web_sitesi'] = this.webSitesi;
    data['logo'] = this.logo;
    return data;
  }
}
