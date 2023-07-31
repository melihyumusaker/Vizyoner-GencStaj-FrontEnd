/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class BlogModel {
  int? id;
  String? resim;
  String? baslik;
  String? icerik;

  BlogModel({this.id, this.resim, this.baslik, this.icerik});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resim = json['resim'];
    baslik = json['baslik'];
    icerik = json['icerik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['resim'] = resim;
    data['baslik'] = baslik;
    data['icerik'] = icerik;
    return data;
  }
}
