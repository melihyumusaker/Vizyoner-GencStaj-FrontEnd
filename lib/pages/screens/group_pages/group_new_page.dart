import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../utils/themecolors/colors.dart';

class GroupPage extends StatefulWidget {
  //String email;
  //int kullaniciId;
  GroupPage({
    Key? key, // required this.email, required this.kullaniciId
  }) : super(key: key);
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarForGroupMainPage(),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.all(30),
                elevation: 20,
                shadowColor: Colors.black,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoCardForMainPage(),
                    Center(
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                                "Seat&Cupra Pazarlama Proje Bazlı #Stajyer İlanı\nGENEL NİTELİKLER\n• Üniversitelerin #Mühendislik , #işletme , #iletişim , #iktisadi ve İdari Bilimler Fakültesinde son sınıf #Öğrencisi veya #Mezun ,\n• En az 4 iş günü çalışabilecek,\n• İyi derecede İngilizce bilen,\n• İletişim becerileri yüksek,\n• Takım çalışmasına yatkın,"),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                                image: NetworkImage(
                                    "https://vizyonergenc.com/storage/1400746/WmHNOeqS4fenlh5jhZNTZa3NDd6Rvh5EIBgjwuYG.jpeg")),
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
      title: Center(child: Text("Ankara Staj Grubu")),
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

  Widget infoCardForMainPage() {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0x00acbfe6),
        radius: 25,
        backgroundImage: NetworkImage(
            'https://play-lh.googleusercontent.com/7429diO-GMzarMlzzfDf7bgeApqwJGibfq3BKqPCa9lS9hd3gLIimTSe5hz9burHeg'),
      ),
      title: Text(
        "Emine Betül Erdoğan",
        style: TextStyle(
          color: OurColor.firstColor,
        ),
      ),
      subtitle: Text(
        "3 dakika Önce",
        style: TextStyle(
          color: OurColor.firstColor,
        ),
      ),
    );
  }
}
