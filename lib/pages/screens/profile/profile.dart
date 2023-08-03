// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:proje/model/EgitimModel.dart';
import 'package:proje/pages/auth/login/login.dart';
import 'package:proje/model/BasvuruModel.dart';
import 'package:proje/pages/screens/hakkimizda/hakkimizda.dart';
import 'package:proje/pages/screens/notifications/notifications.dart';
import 'package:proje/pages/screens/profile/edit_profile.dart';
import 'package:proje/pages/screens/sidebar/sidebar_settings.dart';
import 'package:proje/pages/screens/sidebar/support.dart';
import 'package:proje/service/get_egitim_service.dart';
import 'package:proje/service/get_kullanici_service.dart';
import 'package:proje/service/post_ilan_service.dart';
import 'package:proje/service/profil_basvuru_service.dart';

import '../../../model/IlanModel.dart';
import '../../../model/KullaniciModel.dart';
import '../../../utils/themecolors/colors.dart';
import '../group_pages/group_list_page.dart';

List<IlanModel> ilanList = [];
List<BasvuruModel> appliedIlanList = [];

class ProfilePage extends StatefulWidget {
  String email;
  int kullaniciId;
  ProfilePage({Key? key, required this.email, required this.kullaniciId})
      : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

int _pageValue = 0;

class _ProfilePageState extends State<ProfilePage> {
  BasvuruService basvuruService = new BasvuruService();

  void fetchBasvuruListByKullaniciId() async {
    try {
      GetBasvuruService basvuruService = GetBasvuruService();
      List<BasvuruModel> basvuruList =
          await basvuruService.getAllBasvuruByKullaniciId(widget.kullaniciId);
      setState(() {
        appliedIlanList = basvuruList;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
    fetchEgitim();
    fetchBasvuruListByKullaniciId();
  }

  KullaniciModel myKullanici = new KullaniciModel();
  EgitimModel myEgitim = new EgitimModel();

  Future<void> fetchUser() async {
    try {
      GetUserService service = GetUserService();
      KullaniciModel kullanici = await service.getOneUserByEmail(widget.email);
      // EgitimModel egitim = await service.getOneUserByEmail(widget.email);

      setState(() {
        myKullanici = kullanici;
      });
    } catch (e) {
      print("hata :" + e.toString());
    }
  }

  Future<void> fetchEgitim() async {
    try {
      GetEgitimService egitim_service = GetEgitimService();
      EgitimModel egitim =
          await egitim_service.getEgitimBilgileri(widget.kullaniciId);

      setState(() {
        myEgitim = egitim;
      });
    } catch (e) {
      print("hata :" + e.toString());
    }
  }

  final List<String> hakkinda = [];

  @override
  Widget build(BuildContext context) {
    hakkinda.addAll([
      myKullanici.cinsiyet.toString(),
      myKullanici.dogumTarihi.toString(),
      myKullanici.adres.toString(),
      myKullanici.sirket!.sirketAdi.toString()
    ]);

    return Scaffold(
        appBar: _appBarWidget(),
        drawer: _Drawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text(appliedIlanList[0].ilan!.ilanId.toString()),

                CircleAvatar(
                  backgroundColor: Color(0xACBFE6),
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/circlee.jpg'),
                ),
                const Divider(
                  endIndent: 25,
                  indent: 18,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(myKullanici.ad.toString() +
                    " " +
                    myKullanici.soyad.toString()),
                const SizedBox(
                  height: 15,
                ),
                Text(widget.email),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 15,
                ),
                _profilebuttons(context),
                const SizedBox(height: 20),
                _pageValue == 0
                    ? _hakkimda(context)
                    : _pageValue == 1
                        ? _basvurularimBuilder()
                        : _egitimBilgilerBuilder()
              ],
            ),
          ),
        ));
  }

  Widget _hakkimda(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(hakkinda[index].toString()),
                ),
                Divider(
                  thickness: 2,
                ),
              ]);
        },
      ),
    );
  }

  AppBar _appBarWidget() {
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
      title: Center(child: Text("    Profil")),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditProfilePage()));
            },
            icon: Icon(Icons.edit_note_rounded)),
        IconButton(
          icon: const Icon(Icons.notifications_active),
          tooltip: 'Bildirimler',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Notifications()));
          },
        ),
      ],
    );
  }

  Widget _egitimBilgilerBuilder() {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 600,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.okul.toString()),
              ),
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.bolum.toString()),
              ),
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.sinif.toString() + ".sınıf"),
              ),
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.ortalama.toString()),
              ),
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.kullanici!.adres.toString()),
              ),
              Divider(thickness: 2),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(myEgitim.hakkinda.toString()),
              ),
              Divider(thickness: 2),
            ],
          );
        },
      ),
    );
  }

  Widget _ilanCardBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: appliedIlanList.length,
        itemBuilder: (BuildContext context, int index) {
          Uint8List bytesImageIlan = const Base64Decoder()
              .convert(appliedIlanList[index].ilan!.resim.toString());
          return Card(
            color: OurColor.thirdColor,
            elevation: 25,
            margin: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: InkWell(
              onTap: () {},
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
                                appliedIlanList[index]
                                    .ilan!
                                    .ilanBaslG
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: "OpenSans", fontSize: 15),
                              ),
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

  Widget _basvurularimBuilder() {
    return Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 300,
        child: _ilanCardBuilder());
  }

  Center _profilebuttons(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.blue,
                  textStyle: const TextStyle(fontSize: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  backgroundColor: _pageValue == 0
                      ? OurColor.firstColor
                      : OurColor.thirdColor,
                  foregroundColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _pageValue = 0;
                  });
                },
                child: const Text("Hakkımda"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    backgroundColor: _pageValue == 1
                        ? OurColor.firstColor
                        : OurColor.thirdColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  setState(() {
                    _pageValue = 1;
                  });
                },
                child: const Text("Başvurularım"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 16),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    backgroundColor: _pageValue == 2
                        ? OurColor.firstColor
                        : OurColor.thirdColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
                onPressed: () {
                  setState(() {
                    _pageValue = 2;
                  });
                },
                child: const Text("Eğitim Bilgilerim"),
              ),
            )
          ],
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
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupListPage()),
                  );
                  //Navigator.pop(context);
                },
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.people),
                ),
                title: Text("Gruplar"),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SideBarAyarlar(myKullanici: myKullanici)))
                },
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.settings),
                ),
                title: Text("Ayarlar"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xACBFE6),
        radius: 25,
        backgroundImage: AssetImage('assets/images/circlee.jpg'),
      ),
      title: Text(
        myKullanici.ad.toString() + " " + myKullanici.soyad.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        myKullanici.email.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
