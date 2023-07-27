import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';

import '../../../themecolors/colors.dart';

class PublishPost extends StatefulWidget {
  const PublishPost({Key? key}) : super(key: key);

  @override
  _PublishPostState createState() => _PublishPostState();
}

final List<String> dropdownOptions = [
  'Ankara Staj Grubu',
];

class _PublishPostState extends State<PublishPost> {
  File? _imageFile;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      // Do something with the picked image
      // For example, you can display it in an Image widget
      // or save the image URL to use it later for posting.
      setState(() {
        // Store the image file in a variable to use it later.
        _imageFile = File(pickedImage.path);
        // Now you can display the image in your container or somewhere else.
      });
    }
  }

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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          backgroundColor: OurColor.firstColor,
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
                onSelected: (String selectedOption) {
                  //print('Selected Option: $selectedOption');
                },
                child: Container(
                  padding: EdgeInsets.all(5),
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
        ),
        body: Column(
          children: [
            infoCardForPostPage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                child: TextField(
                  maxLength: 100,
                  maxLines: 6,
                  controller: _controller,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      barrierColor: OurColor.firstColor,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shadowColor: OurColor.firstColor,
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
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 75,
                child: _imageFile != null
                    ? Image.file(_imageFile!) // Display the picked image
                    : Text(
                        'No image selected'), // Display a message if no image is picked
              ),
            ),
            const SizedBox(
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
                      onPressed: _pickImage,
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.public),
                      onPressed: () {},
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
