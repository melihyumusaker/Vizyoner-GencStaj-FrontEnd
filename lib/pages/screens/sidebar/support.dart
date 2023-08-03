import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proje/model/BizeUlas.dart';
import 'package:proje/service/bizeulas_service.dart';

class Destek extends StatefulWidget {
  const Destek({super.key});

  @override
  State<Destek> createState() => _DestekState();
}

class _DestekState extends State<Destek> {
  Future<BizeUlasModel>? _futureBizeUlas;

  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerBaslik = TextEditingController();
  final TextEditingController _controllerIcerik = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF182978),
        title: const Text(
          "Bize Ulaşın",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 175,
                  height: 175,
                  margin: const EdgeInsets.all(5),
                  child: Image.asset("assets/images/vizyonergenc.png")),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yardıma mı ihtiyacın var ? ",
                    style: TextStyle(
                        color: Color(0xFF6688CC),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "Bize Ulaş ",
                    style: TextStyle(color: Color(0xFFACBFE6), fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
                child: TextField(
                  controller: _controllerUserName,
                  decoration: InputDecoration(
                      hintText: "Adınızı Giriniz",
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
                child: TextField(
                  controller: _controllerLastName,
                  decoration: InputDecoration(
                      hintText: "Soyadınızı Giriniz",
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                      hintText: "E mail giriniz",
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
                child: TextField(
                  controller: _controllerBaslik,
                  decoration: InputDecoration(
                      hintText: "Konuyu Giriniz",
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
                child: TextField(
                  maxLines: 4,
                  controller: _controllerIcerik,
                  decoration: InputDecoration(
                      hintText: "Sorununuzu belirtiniz",
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Colors.purple.shade900)),
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      final service = BizeUlasService();
                      _futureBizeUlas = service.createPost(
                        _controllerUserName.text,
                        _controllerLastName.text,
                        _controllerEmail.text,
                        _controllerBaslik.text,
                        _controllerIcerik.text,
                      );
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Butonun köşe yarıçapı
                        side: BorderSide(
                            color: Color(0XFF182978),
                            width: 5), // Kenarlık rengi ve kalınlığı
                      ),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0XFF182978)),
                  ),
                  child: Text(
                    "Gönder",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "OpenSans"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
