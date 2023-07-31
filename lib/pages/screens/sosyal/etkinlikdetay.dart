import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/utils/themecolors/colors.dart';

class EtkinlikDetay extends StatelessWidget {
  String resim;
  String baslik;
  String icerik;
  EtkinlikDetay(
      {required this.resim, required this.icerik, required this.baslik});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OurColor.bgColor,
        appBar: _socailAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                _etkinlikImage(resim),
                _etkinlikBaslik(baslik),
                _etkinlikIcerik(icerik),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _etkinlikIcerik(String text) {
    return  Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Text(
        text,
        style: TextStyle(fontFamily: "OpenSans", fontSize: 18),
      ),
    );
  }

  Text _etkinlikBaslik(String baslik) {
    return  Text(
      baslik,
      style: TextStyle(
          fontFamily: "OpenSans", fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Container _etkinlikImage(String resim) {
    Uint8List bytesImage = const Base64Decoder().convert(resim);
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: 250,
      child: Image.memory(bytesImage),
    );
  }

  AppBar _socailAppBar(BuildContext context) {
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
          title:  FittedBox(
            child: Text(
              baslik,
              style: TextStyle(
                  color: Colors.white, fontFamily: "OpenSans", fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
