import 'package:flutter/material.dart';
import 'package:proje/model/KullaniciModel.dart';
import 'package:proje/pages/screens/hakkimizda/hakkimizda.dart';
import 'package:proje/pages/screens/sidebar/sidebar_settings.dart';
import 'package:proje/pages/screens/sidebar/support.dart';

import 'package:quickalert/quickalert.dart';

// 123.satır

class SideBar extends StatefulWidget {
  KullaniciModel myKullanici;
  
   SideBar({super.key, required this.myKullanici});

  @override
  State<SideBar> createState() => _SideBar();
}

class _SideBar extends State<SideBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  actions: [Icon(Icons.add_sharp)],
        backgroundColor: Color(0XFF182978),
      ),
      drawer: _Drawer(),
    );
  }

  Widget _Drawer() {
    return Drawer(
        child: Container(
      height: double.infinity,
      color: Color(0xFF6688CC),
      child: SafeArea(
          child: Column(
        children: [
          infoCard(),
          Divider(
            color: Colors.white24,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
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
                leading: SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
              ),
              ListTile(
                onTap: () {},
                leading: SizedBox(
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
              Padding(
                padding: const EdgeInsets.only(left: 1.0),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Destek())),
                },
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.help_outline_rounded),
                ),
                title: Text("Destek"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hakkimizda()))
                },
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.abc_outlined),
                ),
                title: Text("Hakkımızda"),
              ),
              ListTile(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SideBarAyarlar(myKullanici: widget.myKullanici,)))
                },
                leading: SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.settings),
                ),
                title: Text("Ayarlar"),
              ),
              ListTile(
                onTap: () {
                  logOutButton();
                },
                leading: SizedBox(
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
        widget.myKullanici.ad.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        widget.myKullanici.email.toString(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  void logOutButton() {
    QuickAlert.show(
      context: context,
      title: "Bilgilendirme",
      type: QuickAlertType.info,
      text: 'Çıkış Yapmak İstediğinizden Emin Misiniz?',
      confirmBtnText: "Çıkış Yap",
      //autoCloseDuration: const Duration(seconds: 10),
      onConfirmBtnTap: () {},
    );
  }
}
