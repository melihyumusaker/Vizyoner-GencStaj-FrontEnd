import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/main.dart';
import 'package:proje/model/KullaniciModel.dart';
import 'package:proje/service/get_kullanici_service.dart';
import 'package:proje/service/post_gonderi_service.dart';
import 'package:proje/utils/themecolors/colors.dart';



class PublishPost extends StatefulWidget {
  String email;
  int id;
  KullaniciModel myKullanici;
  PublishPost(
      {Key? key,
      required this.email,
      required this.id,
      required this.myKullanici})
      : super(key: key);

  @override
  _PublishPostState createState() => _PublishPostState();
}

final List<String> dropdownOptions = [
  'Ankara Staj Grubu',
];

class _PublishPostState extends State<PublishPost> {
  Future<PostGonderiService>? _postService;
  KullaniciModel myKullanici = new KullaniciModel();

  PostGonderiService postService = new PostGonderiService();



  int _currentIndex = 0; // Keep track of the selected tab index
  String? _base64Image;

  File? _image;

  Future<void> _getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });

      List<int> imageBytes = await _image!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      setState(() {
        _base64Image = base64Image;
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });

      List<int> imageBytes = await _image!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      setState(() {
        _base64Image = base64Image;
        print(_base64Image.toString());
      });
    }
  }

  TextEditingController _controller = TextEditingController();

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
        appBar: _appBarWidgetPublishPage(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              infoCardForPostPage(widget.myKullanici),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SizedBox(
                  height: 100,
                  child: TextField(
                    maxLength: 100,
                    maxLines: 2,
                    controller: _controller,
                    onSubmitted: (String value) async {
                      await showDialog<void>(
                        barrierColor: OurColor.firstColor,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
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
              _base64Image != null
                  ? Image.memory(
                      base64Decode(_base64Image.toString()),
                      height: 100,
                    )
                  : const Icon(
                      Icons.photo,
                      size: 100,
                    ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo),
                        onPressed: _getImageFromGallery,
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _getImageFromCamera,
                      ),
                      IconButton(
                        icon: const Icon(Icons.public),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget publish() {


    return Column(
      children: [
        infoCardForPostPage(myKullanici),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            height: 100,
            child: TextField(
              maxLength: 100,
              maxLines: 2,
              controller: _controller,
              onSubmitted: (String value) async {
                await showDialog<void>(
                  barrierColor: OurColor.firstColor,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
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
        _image != null
            ? Image.file(
                _image!,
                height: 100,
              )
            : const Icon(
                Icons.photo,
                size: 100,
              ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width - 50,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: _getImageFromGallery,
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: _getImageFromCamera,
                ),
                IconButton(
                  icon: const Icon(Icons.public),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar _appBarWidgetPublishPage() {
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
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomTabBar(
                      email: widget.email,
                    )),
          );
        },
      ),
      title: const Text("Yeni Gönderi"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<String>(
            tooltip: "Menü",
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },

            onSelected: (String x) {
              try {
                postService.createdPost(
                    _controller.text, _base64Image!, myKullanici);
                print("Post başarılı");
              } catch (ex) {
                print(ex);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.transparent),
              ),
              child: const Text(
                'Gönder',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget infoCardForPostPage(KullaniciModel user) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: Color(0x00acbfe6),
      radius: 25,
      backgroundImage: AssetImage('assets/images/circlee.jpg'),
    ),
    title: Text(

      user.ad.toString() + " " + user.soyad.toString(),
      style: TextStyle(
        color: OurColor.firstColor,
      ),
    ),
  );
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

Widget _Drawer(BuildContext context) {
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
