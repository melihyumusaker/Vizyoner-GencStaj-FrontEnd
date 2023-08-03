import 'package:flutter/material.dart';
import 'package:proje/model/GrupModel.dart';
import 'package:proje/service/get_grup_service.dart';
import 'package:proje/service/like_service.dart';

import '../../../utils/themecolors/colors.dart';
import '../notifications/notifications.dart';
import 'group_new_page.dart';

class GroupListPage extends StatefulWidget {
  //String email;

  GroupListPage({
    Key? key,
    //required this.email,
  }) : super(key: key);

  @override
  _GroupListPageState createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  Color buttonColor = OurColor.firstColor; // Default button color

  LikeService likeService =  LikeService();
  List<GrupModel> grupModelList = [];

  @override
  void initState() {
    super.initState();
    fetchGrupList();
  }

  Future<void> fetchGrupList() async {
    try {
      GetGrupService grupService = new GetGrupService();
      List<GrupModel> list = await grupService.fetchGrupList();
      setState(() {
        grupModelList = list;
      });
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  _navigateToGroupPage(GrupModel grupModel) async {
    // Navigate to the GroupPage using Navigator.push and await the result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GroupPage(
                grupModel: grupModel,
              )),
    );

    // When returning from the GroupPage, check the result and update the button color
    if (result != null && result == 'success') {
      setState(() {
        buttonColor = Colors.green; // Change the button color to green
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarForGroupListPage(),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: grupModelList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 20,
                  shadowColor: Colors.black,
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          grupModelList[index].grupAdi.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            textStyle: TextStyle(fontSize: 16),
                          ),
                          onPressed: () =>
                              _navigateToGroupPage(grupModelList[index]),
                          child: const Text('Grubu Görüntüle'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }

  AppBar _appBarForGroupListPage() {
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
      title: Center(child: Text("Gruplar")),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_active),
          tooltip: 'Bildirimler',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Notifications()),
            );
          },
        ),
      ],
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
                title: const Text("Yeni Bağlantı Ekle"),
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
                title: const Text("Duyurular"),
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
                title: const Text("Destek"),
              ),
              ListTile(
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.settings),
                ),
                title: const Text("Ayarlar"),
              ),
              ListTile(
                onTap: () {},
                leading: const SizedBox(
                  height: 34,
                  width: 34,
                  child: Icon(Icons.exit_to_app),
                ),
                title: const Text("Çıkış"),
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
        backgroundColor: Color(0x00acbfe6),
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
