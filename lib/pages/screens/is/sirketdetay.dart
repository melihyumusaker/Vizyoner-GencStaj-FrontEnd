import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/utils/themecolors/colors.dart';

class SirketDetay extends StatelessWidget {
  final String logo;
  final String firmaAd;
  final String icerik;

  SirketDetay(
      {required this.logo, required this.firmaAd, required this.icerik});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColor.bgColor,
      appBar: _ilanDetayAppBar(context),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: OurColor.thirdColor,
          elevation: 50,
          child: Column(
            children: [
              _sirketLogo(logo),
              _firmaAdText(firmaAd),
              _firmaDetayText(icerik),
            ],
          ),
        ),
      ),
    );
  }

  Padding _firmaDetayText(String text) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  Padding _firmaAdText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  SizedBox _sirketLogo(String logo) {
    Uint8List bytesImage = const Base64Decoder().convert(logo);

    return SizedBox(
      width: 150,
      height: 150,
      child: Image.memory(bytesImage, height: 170, width: 150),
    );
  }

  AppBar _ilanDetayAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: OurColor.firstColor,
      title: Padding(
        padding: const EdgeInsets.only(right: 30),
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
              'Şirket Detay',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSans",
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String text =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt sagittis luctus. Vivamus quis libero condimentum quam bibendum pretium. Quisque a tellus porttitor dolor fringilla fringilla. Ut non posuere quam, in sodales lorem. Cras varius elementum urna, ac rutrum sem pellentesque non. Aenean condimentum leo at porttitor pellentesque. Mauris ultricies massa consequat massa dignissim, eu luctus leo varius. Sed vel bibendum nisl, vel maximus sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In pretium dui malesuada elit maximus pretium. Morbi bibendum quam eget nunc dapibus, quis faucibus lorem elementum.";
