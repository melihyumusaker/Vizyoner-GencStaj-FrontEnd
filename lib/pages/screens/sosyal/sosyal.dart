import 'package:flutter/material.dart';
import 'package:proje/pages/screens/profile/profile.dart';
import 'package:proje/pages/screens/sosyal/blogdetay.dart';
import 'package:proje/pages/screens/sosyal/etkinlikdetay.dart';
import 'package:proje/themecolors/colors.dart';

import '../bottom_nav_bar/animated_bottom_navigation_bar.dart';
import '../home_screen/home_page.dart';
import '../is/is.dart';
import '../publish_post_page/publish_post_page.dart';

class Sosyal extends StatefulWidget {
  const Sosyal({super.key});

  @override
  State<Sosyal> createState() => _SosyalState();
}

class _SosyalState extends State<Sosyal> {
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
          builder: (context) => const ProfilePage(),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: OurColor.bgColor,
        appBar: _socailAppBar(context),
        bottomNavigationBar: _bottomNavigationBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                _blogCard("Melih ve Arkadadaslari"),
                const SizedBox(height: 25),
                _etkinlikCard("Frontend Design")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _blogCard(String text) {
    String displayedTitle =
        text.length > 10 ? "${text.substring(0, 10)} ..." : text;
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BlogDetay()));
                          },
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset("assets/images/facebook.jpg"),
                          ),
                        ),
                        Text(displayedTitle),
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

  Card _etkinlikCard(String text) {
    String displayedTitle =
        text.length > 10 ? "${text.substring(0, 12)} ..." : text;
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EtkinlikDetay()));
                          },
                          child: SizedBox(
                            height: 130,
                            width: 130,
                            child: Image.asset("assets/images/facebook.jpg"),
                          ),
                        ),
                        Text(displayedTitle),
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

  MoltenBottomNavigationBar _bottomNavigationBar() {
    return MoltenBottomNavigationBar(
      tabs: _tabs,
      selectedIndex: _currentIndex,
      onTabChange: _onTabChange,
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
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
}
