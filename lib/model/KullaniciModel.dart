class KullaniciModel {
  int? kullaniciId;
  String? ad;
  String? soyad;
  String? email;
  String? sifre;
  String? dogumTarihi;
  String? fotograf;
  String? cinsiyet;
  String? uyruk;
  String? adres;
  int? baglantiSayisi;
  int? takipSayisi;

  KullaniciModel(
      {this.kullaniciId,
      this.ad,
      this.soyad,
      this.email,
      this.sifre,
      this.dogumTarihi,
      this.fotograf,
      this.cinsiyet,
      this.uyruk,
      this.adres,
      this.baglantiSayisi,
      this.takipSayisi});

  KullaniciModel.fromJson(Map<String, dynamic> json) {
    kullaniciId = json['kullaniciId'];
    ad = json['ad'];
    soyad = json['soyad'];
    email = json['email'];
    sifre = json['sifre'];
    dogumTarihi = json['dogum_tarihi'];
    fotograf = json['fotograf'];
    cinsiyet = json['cinsiyet'];
    uyruk = json['uyruk'];
    adres = json['adres'];
    baglantiSayisi = json['baglanti_sayisi'];
    takipSayisi = json['takip_sayisi'];
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
    data['cinsiyet'] = this.cinsiyet;
    data['uyruk'] = this.uyruk;
    data['adres'] = this.adres;
    data['baglanti_sayisi'] = this.baglantiSayisi;
    data['takip_sayisi'] = this.takipSayisi;
    return data;
  }
}
