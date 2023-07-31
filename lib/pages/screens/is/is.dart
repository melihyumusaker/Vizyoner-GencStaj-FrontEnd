import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/SirketModel.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';

import 'package:proje/pages/screens/is/isilandetay.dart';
import 'package:proje/pages/screens/is/sirketdetay.dart';
import 'package:proje/service/sirket_service.dart';
import 'package:proje/themecolors/colors.dart';

class Is extends StatefulWidget {
  const Is({super.key});

  @override
  State<Is> createState() => _IsState();
}

int _pageValue = 0;

class _IsState extends State<Is> {
  List<SirketModel> sirketList = [];

  @override
  void initState() {
    super.initState();
    fetchSirketList();
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
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
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
                      builder: (context) => const IsIlanDetay(),
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
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 20, left: 35, bottom: 10),
                              child: Text(
                                "İlan Başlığı",
                                style: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: const [
                                Icon(Icons.apartment),
                                SizedBox(width: 15),
                                Text(
                                  "Firma İsmi",
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: const [
                                Icon(Icons.timelapse),
                                SizedBox(width: 15),
                                Text(
                                  "Tam Zamanlı",
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: const [
                                Icon(Icons.location_on),
                                SizedBox(width: 15),
                                Text(
                                  "Uzun Adres",
                                  style: TextStyle(fontFamily: "OpenSans"),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 25),
                              child: Row(children: const [
                                Icon(Icons.date_range),
                                SizedBox(width: 15),
                                Text(
                                  "Tarihler İsmi",
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
      automaticallyImplyLeading: false,
      backgroundColor: OurColor.firstColor,
      title: ListTile(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
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
