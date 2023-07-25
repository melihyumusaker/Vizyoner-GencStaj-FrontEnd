// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:proje/pages/screens/bottom_nav_bar/animated_bottom_navigation_bar.dart';
import 'package:proje/pages/screens/search_page/search.dart';

import '../../../themecolors/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Keep track of the selected tab index
  List<MoltenTab> _tabs = [
    MoltenTab(
      icon: Icon(Icons.home),
      title: Text('Ana Sayfa'),
      // Optional title for the selected tab
    ),
    MoltenTab(
      icon: Icon(Icons.person),
      title: Text('Pofil'),
    ),
    MoltenTab(
      icon: Icon(Icons.add),
      title: Text('Yayınla'),
    ),
    MoltenTab(
      icon: Icon(Icons.people),
      title: Text('Sosyal'),
    ),
    MoltenTab(
      icon: Icon(Icons.work),
      title: Text('İş'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [OurColor.firstColor, OurColor.secondColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.transparent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            child: const Text('Ara', style: TextStyle(color: Colors.white)),
          ),

          // you can put any Widget

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_active),
              tooltip: 'Bildirimler',
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: MoltenBottomNavigationBar(
          // Pass the required properties to the MoltenBottomNavigationBar
          tabs: _tabs,

          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        drawer: _Drawer(),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(30),
                elevation: 20,
                shadowColor: Colors.black,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoCardForMainPage(),
                    const Center(
                      child: Column(
                        children: [
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
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
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.help_outline_rounded),
                ),
                title: Text("Destek"),
              ),
              ListTile(
                onTap: () {},
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
}

Widget infoCardForMainPage() {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: Color(0xACBFE6),
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
