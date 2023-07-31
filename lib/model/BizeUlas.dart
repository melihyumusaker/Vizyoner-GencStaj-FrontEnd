class BizeUlasModel {
  int? id;
  String? ad;
  String? soyad;
  String? email;
  String? baslik;
  String? icerik;

  BizeUlasModel({
    this.id,
    this.ad,
    this.soyad,
    this.email,
    this.baslik,
    this.icerik,
  });

  // JSON'dan BizeUlasModel nesnesini oluşturmak için fabrika metodu
  factory BizeUlasModel.fromJson(Map<String, dynamic> json) {
    return BizeUlasModel(
      id: json['id'],
      ad: json['ad'],
      soyad: json['soyad'],
      email: json['email'],
      baslik: json['baslik'],
      icerik: json['icerik'],
    );
  }

  // BizeUlasModel nesnesini JSON'a dönüştürme metodu
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ad': ad,
      'soyad': soyad,
      'email': email,
      'baslik': baslik,
      'icerik': icerik,
    };
  }
}