import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class SideBarAyarlar extends StatefulWidget {
  const SideBarAyarlar({super.key});

  @override
  State<SideBarAyarlar> createState() => _SideBarAyarlar();
}

class _SideBarAyarlar extends State<SideBarAyarlar> {
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
                    btnOkOnPress: () {},
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
