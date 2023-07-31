import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:proje/utils/themecolors/colors.dart';

class IsIlanDetay extends StatelessWidget {
  final String ilanBaslG;
  final String metin;
  final String resim;
  final String firmaAdi;
  final String adress;
  final String tarih;

  const IsIlanDetay({
    super.key,
    required this.ilanBaslG,
    required this.metin,
    required this.resim,
    required this.firmaAdi,
    required this.adress,
    required this.tarih,
  });

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
              _ilanNameText(ilanBaslG),
              _icerikText(metin),
              _logo(resim),
              _firmaNameText(firmaAdi),
              _adresText(adress),
              _tarihText(tarih),
              _basvurButton(context),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Container _basvurButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      width: (MediaQuery.of(context).size.width - 100) / 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: OurColor.secondColor,
          foregroundColor: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Text("Başvur"),
      ),
    );
  }

  Padding _icerikText(String metin) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        metin,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  Text _tarihText(String tarih) {
    return Text(
      tarih,
      style: TextStyle(
          fontFamily: "OpenSans", color: Colors.black45, fontSize: 18),
    );
  }

  Padding _adresText(String adress) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        adress,
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black54, fontSize: 18),
      ),
    );
  }

  Padding _firmaNameText(String firmaAdi) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Text(
        firmaAdi,
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  Padding _ilanNameText(String ilanBaslG) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        ilanBaslG,
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  SizedBox _logo(String resim) {
    Uint8List bytesImageIlan = const Base64Decoder().convert(resim);

    return SizedBox(
      width: 150,
      height: 150,
      child: Image.memory(bytesImageIlan, height: 170, width: 150),
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
              'İlan Detayı',
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
