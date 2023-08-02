import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/SirketModel.dart';
import 'package:proje/pages/screens/is/isilandetay.dart';
import 'package:proje/pages/screens/is/sirketdetay.dart';
import 'package:proje/service/get_ilan_service.dart';
import 'package:proje/service/sirket_service.dart';
import 'package:proje/utils/themecolors/colors.dart';

import '../../../model/IlanModel.dart';
import '../hakkimizda/hakkimizda.dart';
import '../sidebar/sidebar_settings.dart';
import '../sidebar/support.dart';

class Is extends StatefulWidget {
  String email;
  Is({super.key, required this.email});

  @override
  State<Is> createState() => _IsState();
}

int _pageValue = 0;

class _IsState extends State<Is> {
  List<SirketModel> sirketList = [];
  List<IlanModel> ilanList = [];

  @override
  void initState() {
    super.initState();
    fetchSirketList();
    fetchIlanList();
  }

  Future<void> fetchIlanList() async {
    try {
      IlanService service = IlanService();
      List<IlanModel> list = await service.fetchIlanList();
      setState(() {
        ilanList = list;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Future<void> fetchSirketList() async {
    try {
      SirketService service = SirketService();
      List<SirketModel> list = await service.fetchSirketList();
      setState(() {
        sirketList = list;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _isAppBar(context),
        drawer: _Drawer(),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              _ilansirketbuttons(context),
              const SizedBox(height: 20),
              _pageValue == 0 ? _ilanCardBuilder() : _sirketCardBuilder()
            ],
          ),
        ),
      ),
    );
  }

  Center veriBeklemede() {
    return Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    ));
  }

  Expanded _ilanCardBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: ilanList.length,
        itemBuilder: (BuildContext context, int index) {
          Uint8List bytesImageIlan =
              const Base64Decoder().convert(ilanList[index].resim!);
          return Card(
            color: OurColor.thirdColor,
            elevation: 25,
            margin: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IsIlanDetay(
                        ilanModel: ilanList[index],
                        email: widget.email,
                        ilanBaslG: ilanList[index].ilanBaslG ??=
                            "Fallback Value",
                        metin: ilanList[index].ilanMetni ??= "Fallback Value",
                        resim: ilanList[index].resim ??= "Fallback Value",
                        firmaAdi: ilanList[index].sirket!.sirketAdi ??=
                            "Fallback Value",
                        adress: ilanList[index].sirket!.adres ??=
                            "Fallback Value",
                        tarih: ilanList[index].bitisTarihi ??= "Fallback Value",
                      ),
                    ));
              },
              child: SizedBox(
                width: 200,
                height: 220,
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 35, bottom: 10),
                              child: Text(
                                ilanList[index].ilanBaslG.toString(),
                                style: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: [
                                Icon(Icons.apartment),
                                SizedBox(width: 15),
                                Text(
                                  ilanList[index].sirket!.sirketAdi.toString(),
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: [
                                Icon(Icons.timelapse),
                                SizedBox(width: 15),
                                Text(
                                  ilanList[index].ilanTuru.toString(),
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: [
                                Icon(Icons.date_range),
                                SizedBox(width: 15),
                                Text(
                                  ilanList[index].bitisTarihi.toString(),
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: const EdgeInsets.only(right: 25),
                        child: Image.asset("assets/images/facebook.jpg"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _Drawer() {
    return Drawer(
        child: Container(
      height: double.infinity,
      color: const Color(0xFF6688CC),
      child: SafeArea(
          child: Column(
        children: [
          infoCard(),
          const Divider(
            color: Colors.white24,
            height: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 0, top: 5, bottom: 5),
          ),
          Column(
            children: [
              Text(
                "Sosyal".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              ListTile(
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.person_add_alt),
                ),
                title: Text("Yeni Bağlantı Ekle"),
              ),
            ],
          ),

          Column(
            children: [
              Text(
                "İçerik".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
              ),
              ListTile(
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.assignment_ind),
                ),
                title: Text("Duyurular"),
              ),
              Text(
                "Hesap".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 1.0),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Destek())),
                },
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.help_outline_rounded),
                ),
                title: Text("Destek"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hakkimizda())),
                },
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.description),
                ),
                title: Text("Hakkımızda"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SideBarAyarlar()))
                },
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.settings),
                ),
                title: Text("Ayarlar"),
              ),
              ListTile(
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.exit_to_app),
                ),
                title: Text("Çıkış"),
              ),
            ],
          )

          ///
        ],
      )),
    ));
  }

  Widget infoCard() {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xACBFE6),
        radius: 25,
        backgroundImage: AssetImage('assets/images/circlee.jpg'),
      ),
      title: Text(
        "Asuman Kiper",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "asuman.kiper00@gmail.com",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Center _ilansirketbuttons(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              height: 40,
              width: (MediaQuery.of(context).size.width - 100) / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 18),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: _pageValue == 1
                      ? OurColor.thirdColor
                      : OurColor.secondColor,
                  foregroundColor: Colors.white,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _pageValue = 0;
                  });
                },
                child: const Text("İlanlar"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              height: 40,
              width: (MediaQuery.of(context).size.width - 100) / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 18),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    backgroundColor: _pageValue == 0
                        ? OurColor.thirdColor
                        : OurColor.secondColor,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {
                  setState(() {
                    _pageValue = 1;
                  });
                },
                child: const Text("Şirketler"),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _isAppBar(BuildContext context) {
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
      title: ListTile(
        title: const Center(
          child: Text(
            'VG İş',
            style: TextStyle(
                color: Colors.white, fontFamily: "OpenSans", fontSize: 20),
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Expanded _sirketCardBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: sirketList.length,
        itemBuilder: (BuildContext context, int index) {
          Uint8List bytesImage =
              const Base64Decoder().convert(sirketList[index].logo!);
          return Card(
            color: OurColor.thirdColor,
            elevation: 25,
            margin: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: SizedBox(
              width: 100,
              height: 220,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 170,
                            width: 150,
                            child: Image.memory(bytesImage,
                                height: 170, width: 150),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.blue,
                              textStyle: const TextStyle(fontSize: 18),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              backgroundColor: OurColor.secondColor,
                              foregroundColor: Colors.white,
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SirketDetay(
                                        firmaAd: sirketList[index].sirketAdi!,
                                        icerik:
                                            sirketList[index].sirketAciklamasi!,
                                        logo: sirketList[index].logo!),
                                  ));
                            },
                            child: const Text("Detay.."),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
