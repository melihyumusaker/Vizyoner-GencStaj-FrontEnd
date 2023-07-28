import 'package:flutter/material.dart';
import 'package:proje/themecolors/colors.dart';

class Vizyon extends StatelessWidget {
  const Vizyon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: Stack(children: [
        _bgimage(context),
        Column(children: [
          const SizedBox(height: 70),
          _logo(context),
          _vizyonText(),
        ]),
      ]),
    );
  }

  Container _bgimage(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgimage.jpg"),
            fit: BoxFit.fill,
          ),
        ));
  }

  Padding _vizyonText() {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25),
      child: Text(
        _text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Container _logo(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 1 / 4,
        width: MediaQuery.of(context).size.height * 1 / 4,
        child: Image.asset("assets/images/vizyonergenc.png"));
  }

  final String _text =
      "   Vizyoner Genç Projesi; günden güne küresel bir marka haline gelen Türk Savunma Sanayii’nin ulaştığı yetkinlik seviyesinin sürdürülebilir kılınmasının, üstlenilen iddialı projelerin başarıyla tamamlanmasının ve ileri teknoloji alanında ülkemizin takip eden değil, yön veren konumuna yükselmesinin ancak ve ancak sektörün yüksek nitelikli insan kaynağına erişim sağlayabilmesi durumunda mümkün olacağı düşüncesinden yola çıkarak başlatılmıştır.";
}

AppBar _appBarWidget(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [OurColor.firstColor, OurColor.secondColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    backgroundColor: OurColor.firstColor,
    title: Padding(
      padding: const EdgeInsets.only(right: 50),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Center(
          child: Text(
            'Vizyonumuz',
            style: TextStyle(
                color: Colors.white, fontFamily: "OpenSans", fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
