import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:proje/model/GonderiModel.dart';
import 'package:proje/model/GrupModel.dart';
import 'package:proje/service/get_grup_gonderi.dart';
import '../../../utils/themecolors/colors.dart';

class GroupPage extends StatefulWidget {
  //String email;
  //int kullaniciId;
  GrupModel grupModel = new GrupModel();
  GroupPage({
    Key? key,
    required this.grupModel,
  }) : super(key: key);
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final GetGrupGonderiService grupService = new GetGrupGonderiService();
  List<GonderiModel> myList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchGrupGonderi();
  }

  void fetchGrupGonderi() async {
    List<dynamic> kullaniciIDListesiDynamic = widget.grupModel.uyeler!
        .map((kullanici) => kullanici.kullaniciId)
        .toList();

    List<int> kullaniciIDListesi = kullaniciIDListesiDynamic.map((item) {
      if (item is int) {
        return item;
      } else if (item is String) {
        return int.tryParse(item) ?? 0;
      } else {
        return 0;
      }
    }).toList();

    List<GonderiModel> list =
        await grupService.getGrupGonderileri(kullaniciIDListesi);

    setState(() {
      myList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarForGroupMainPage(),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              String postResim = myList[index].fotografGonderi.toString();
              int mod4 = postResim.length % 4;
              if (mod4 > 0) {
                postResim += '=' * (4 - mod4);
              }
              return Card(
                margin: const EdgeInsets.all(30),
                elevation: 20,
                shadowColor: Colors.black,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _grupInfoText(),
                    infoCardForMainPage(widget.grupModel, index),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(myList[index].icerik.toString()),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image.memory(
                              base64Decode(postResim),
                              width: 350,
                              height: 250,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("13 beğeni"),
                    ),
                    const Divider(
                      height: 15,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border_outlined),
                          tooltip: 'Beğen',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('This is a snackbar')));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment),
                          tooltip: 'Yorum',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('This is a snackbar')));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.send),
                          tooltip: 'Paylaş',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('This is a snackbar')));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  Padding _grupInfoText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          widget.grupModel.grupAdi.toString() + " Grubu Gönderisidir",
          style: TextStyle(
              fontFamily: "OpenSans", fontSize: 15, color: Colors.black54),
        ),
      ),
    );
  }

  AppBar _appBarForGroupMainPage() {
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
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // When you're done with the GroupPage, you can pop and pass a result if needed
          Navigator.pop(context, 'success');
        },
      ),
      title: Center(child: Text(widget.grupModel.grupAdi.toString())),
      actions: <Widget>[
        Container(
          width: 60,
          height: 35,
          child: AnimatedButton(
            pressEvent: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.bottomSlide,
                showCloseIcon: true,
                title: "Dikkat",
                desc: "Gruba Katılmak istediğinizden emin misiniz?",
                btnCancelOnPress: () {},
                btnOkOnPress: () => {},
                btnCancelText: "Hayır",
                btnOkText: "Evet",
              ).show();
            },
            text: "Katıl",
            buttonTextStyle: TextStyle(color: Colors.white, fontSize: 22),
            color: OurColor.secondColor,
          ),
        )
      ],
    );
  }

  Widget infoCardForMainPage(GrupModel grupModel, int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0x00acbfe6),
        radius: 25,
        backgroundImage: NetworkImage(
            'https://play-lh.googleusercontent.com/7429diO-GMzarMlzzfDf7bgeApqwJGibfq3BKqPCa9lS9hd3gLIimTSe5hz9burHeg'),
      ),
      title: Text(
        myList[index].kullanici!.ad.toString() +
            " " +
            myList[index].kullanici!.soyad.toString(),
        style: TextStyle(
          color: OurColor.firstColor,
        ),
      ),
    );
  }
}
