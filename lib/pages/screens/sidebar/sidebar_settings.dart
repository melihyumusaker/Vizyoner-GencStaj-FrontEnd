import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/KullaniciModel.dart';
import 'package:proje/pages/auth/login/login.dart';
import 'package:proje/service/delete_user_service.dart';

class SideBarAyarlar extends StatefulWidget {
  KullaniciModel myKullanici;
   SideBarAyarlar({super.key ,  required this.myKullanici});

  @override
  State<SideBarAyarlar> createState() => _SideBarAyarlar();
}

class _SideBarAyarlar extends State<SideBarAyarlar> {

    @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF182978),
        title: Text("Ayarlar"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              AnimatedButton(
                pressEvent: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.bottomSlide,
                    showCloseIcon: true,
                    title: "Dikkat",
                    desc: "Hesabı silmek istediğinizden emin misiniz?",
                    btnCancelOnPress: () {},
                    btnOkOnPress: () => {DeleteUserFromDatabase().deleteUser(widget.myKullanici.kullaniciId!),Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()))},
                    btnCancelText: "Hayır",
                    btnOkText: "Evet",
                  ).show();
                },
                text: "Hesap Sil",
                color: Color(0XFF182978),
              )
            ],
          ),
        ),
      ),
    );
  }
}
