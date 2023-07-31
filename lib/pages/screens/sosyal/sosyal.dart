import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/BlogModel.dart';
import 'package:proje/model/EtkinlikModel.dart';
import 'package:proje/pages/screens/sosyal/blogdetay.dart';
import 'package:proje/pages/screens/sosyal/etkinlikdetay.dart';
import 'package:proje/service/blog_service.dart';
import 'package:proje/service/etkinlik_service.dart';
import 'package:proje/utils/themecolors/colors.dart';

import '../hakkimizda/hakkimizda.dart';
import '../sidebar/sidebar_settings.dart';
import '../sidebar/support.dart';

class Sosyal extends StatefulWidget {
  const Sosyal({super.key});

  @override
  State<Sosyal> createState() => _SosyalState();
}

class _SosyalState extends State<Sosyal> {
  List<BlogModel> blogList = [];
  List<EtkinlikModel> etkinlikList = [];

  @override
  void initState() {
    super.initState();
    fetchBlogList();
    fetchEtkinlikList();
  }

  Future<void> fetchBlogList() async {
    try {
      BlogService service = BlogService();
      List<BlogModel> list = await service.fetchBlogList();
      setState(() {
        blogList = list;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Future<void> fetchEtkinlikList() async {
    try {
      EtkinlikService service = EtkinlikService();
      List<EtkinlikModel> etkinlik = await service.fetchEtkinlikList();
      setState(() {
        etkinlikList = etkinlik;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: OurColor.bgColor,
        appBar: _socailAppBar(context),
        drawer: _Drawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _blogCard(blogList),
                const SizedBox(height: 25),
                _etkinlikCard(etkinlikList)
              ],
            ),
          ),
        ),
      ),
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
      title: ListTile(
        title: const Center(
          child: Text(
            'Sosyal',
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

  Card _etkinlikCard(List<EtkinlikModel> etkinlikList) {
    return Card(
      color: OurColor.cardColor,
      elevation: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Öne Çıkan Etkinlikler",
              style: TextStyle(fontSize: 18, fontFamily: "OpenSans"),
            ),
          ),
          Card(
            color: OurColor.cardColor,
            elevation: 100,
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: etkinlikList.length,
                itemBuilder: (context, index) {
                  EtkinlikModel etkinlik = etkinlikList[index];
                  String base64Data = etkinlik.resim!;
                  int mod4 = base64Data.length % 4;
                  if (mod4 > 0) {
                    base64Data += '=' * (4 - mod4);
                  }
                  Uint8List bytesImage = base64.decode(base64Data);
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtkinlikDetay(
                                          resim: etkinlik.resim!,
                                          icerik: etkinlik.icerik!,
                                          baslik: etkinlik.baslik!,
                                        )));
                          },
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.memory(bytesImage,
                                height: 150, width: 150),
                          ),
                        ),
                        FittedBox(child: Text(etkinlik.baslik!)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card _blogCard(List<BlogModel> list) {
    return Card(
      color: OurColor.cardColor,
      elevation: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Blog'da Öne Çıkanlar",
              style: TextStyle(fontSize: 18, fontFamily: "OpenSans"),
            ),
          ),
          Card(
            color: OurColor.cardColor,
            elevation: 100,
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, int index) {
                  BlogModel blog = list[index];
                  String base64Data = blog.resim!;

                  int mod4 = base64Data.length % 4;
                  if (mod4 > 0) {
                    base64Data += '=' * (4 - mod4);
                  }
                  Uint8List bytesImage = base64.decode(base64Data);
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlogDetay(
                                    resim: blog.resim!,
                                    icerik: blog.icerik!,
                                    baslik: blog.baslik!,
                                  ),
                                ));
                          },
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.memory(bytesImage,
                                height: 150, width: 150),
                          ),
                        ),
                        FittedBox(
                            child: Text(
                          blog.baslik!,
                          locale: const Locale('tr', 'TR'),
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
