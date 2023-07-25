import 'dart:js';

import 'package:flutter/material.dart';

import '../../../themecolors/colors.dart';

class PublishPost extends StatefulWidget {
  const PublishPost({Key? key}) : super(key: key);

  @override
  _PublishPostState createState() => _PublishPostState();
}

class _PublishPostState extends State<PublishPost> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: OurColor.firstColor,
          title: const Text("Yeni Gönderi"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.send_sharp),
              tooltip: 'Gönder',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            infoCardForPostPage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400,
                child: TextField(
                  maxLength: 150,
                  maxLines: 6,
                  controller: _controller,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      barrierColor: OurColor.firstColor,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Thanks!'),
                       //   shadowColor: OurColor.firstColor,
                          content: Text(
                              'You typed "$value", which has length ${value.characters.length}.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 75,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.photo),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('This is a snackbar')));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('This is a snackbar')));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.public),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('This is a snackbar')));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Widget infoCardForPostPage() {
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
  );
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
              style: Theme.of(context as BuildContext)
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
              style: Theme.of(context as BuildContext)
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
              style: Theme.of(context as BuildContext)
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
