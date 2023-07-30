// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/pages/screens/bottom_nav_bar/animated_bottom_navigation_bar.dart';
import 'package:proje/pages/screens/hakkimizda/hakkimizda.dart';
import 'package:proje/pages/screens/notifications/notifications.dart';
import 'package:proje/pages/screens/sidebar/sidebar_settings.dart';
import 'package:proje/pages/screens/sidebar/support.dart';
import 'package:proje/pages/screens/sosyal/sosyal.dart';

import '../../../themecolors/colors.dart';
import '../home_screen/home_page.dart';
import '../is/is.dart';
import '../publish_post_page/publish_post_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

int _pageValue = 0;

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  int _currentIndex = 0; // Keep track of the selected tab index

  final List<MoltenTab> _tabs = [
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

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PublishPost(),
        ));
        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Sosyal(),
        ));
        break;
      case 4:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const Is(),
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarWidget(),
        bottomNavigationBar: _bottomNavigationBar(),
        drawer: _Drawer(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image != null
                      ? Image.file(
                          _image!,
                          height: 100,
                        )
                      : const Icon(
                          Icons.photo,
                          size: 100,
                        ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _getImageFromGallery,
                  ),
                ],
              ),
              const Divider(
                endIndent: 25,
                indent: 18,
                thickness: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text("EMİNE BETÜL ERDOĞAN"),
              const SizedBox(
                height: 15,
              ),
              Text("betulerdgn52@gmail.com"),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("5 Bağlantı"),
                  Text("100 Firma"),
                  Text("14 Etiket"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _profilebuttons(context),
              const SizedBox(height: 20),
              //_pageValue == 0 ? _gonderilerBuilder() : _basvurularimBuilder()
              if (_pageValue == 0)
                _gonderilerBuilder()
              else if (_pageValue == 1)
                _basvurularimBuilder()
              else if (_pageValue == 2)
                _takipEdilenSirketlerBuilder()
            ],
          ),
        ));
  }

  Widget _hakkimda() {
    return Center(
      child: Column(
        children: [],
      ),
    );
  }

  MoltenBottomNavigationBar _bottomNavigationBar() {
    return MoltenBottomNavigationBar(
      tabs: _tabs,
      selectedIndex: _currentIndex,
      onTabChange: _onTabChange,
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
      actions: <Widget>[
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

  Expanded _takipEdilenSirketlerBuilder() {
    return Expanded(
        child: Text("Henüz Takip Ettiğiniz Şirket Bulunmamaktadır"));
  }

  Expanded _basvurularimBuilder() {
    return Expanded(child: Text("Henüz Başvurunuz Bulunmamaktadır"));
  }

  Widget _gonderilerBuilder() {
    return Container();
  }

  Widget _MainPageListViewCard() {
    return ListView.builder(
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
                            "https://vizyonergenc.com/storage/1400746/WmHNOeqS4fenlh5jhZNTZa3NDd6Rvh5EIBgjwuYG.jpeg"),
                      ),
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
                          const SnackBar(content: Text('This is a snackbar')));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment),
                    tooltip: 'Yorum',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('This is a snackbar')));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    tooltip: 'Paylaş',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('This is a snackbar')));
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
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
                child: const Text("Hakımda"),
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
                child: const Text("Eğitim Bilgierim"),
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
      "3 dakika önce",
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
