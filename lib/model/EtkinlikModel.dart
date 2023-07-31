/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class EtkinlikModel {
    int? id;
    String? baslik;
    String? icerik;
    String? resim;

    EtkinlikModel({this.id, this.baslik, this.icerik, this.resim}); 

    EtkinlikModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        baslik = json['baslik'];
        icerik = json['icerik'];
        resim = json['resim'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['baslik'] = baslik;
        data['icerik'] = icerik;
        data['resim'] = resim;
        return data;
    }
}

