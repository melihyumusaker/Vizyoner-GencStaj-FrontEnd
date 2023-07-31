import 'package:flutter/material.dart';
import 'package:proje/utils/themecolors/colors.dart';

// ignore: must_be_immutable
class Misyon extends StatelessWidget {
  const Misyon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: Stack(children: [
        _bgimage(context),
        Column(children: [
          const SizedBox(height: 70),
          _logo(context),
          _misyonText(),
        ]),
      ]),
    );
  }

  Container _bgimage(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 75,
        height: MediaQuery.of(context).size.height - 75,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgimage.jpg"),
            fit: BoxFit.cover,
          ),
        ));
  }

  Padding _misyonText() {
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
      "   Türk Savunma Sanayii’nin amiral gemisi konumundaki Türk Silahlı Kuvvetlerini Güçlendirme Vakfı şirketleri başta olmak üzere sektörün önde gelen kurum ve kuruluşlarının; genç profesyoneller ve sektörde görev almak isteyen yüksek nitelikli bireylerle buluşma noktası haline gelmeyi hedefleyen Vizyoner Genç, bu çerçevede hem staj ile eğitim programları hem de istihdam çalışmalarıyla gerek ülkemize gerekse de sektöre hizmet etmeyi sürdürmektedir.";
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
            'Misyonumuz',
            style: TextStyle(
                color: Colors.white, fontFamily: "OpenSans", fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
