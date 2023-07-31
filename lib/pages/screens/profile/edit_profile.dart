// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proje/pages/screens/notifications/notifications.dart';

import '../../../utils/themecolors/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

int _pageValue = 0;

class _EditProfilePageState extends State<EditProfilePage> {
  final List<String> dropdownOptions = [
    'Kadın',
    'Erkek',
    'Belirtmek İstemiyorum'
  ];

  final List<String> dropdownOptionsEgitim = [
    'Hazırlı',
    '1.Sınıf',
    '2.Sınıf',
    '3.Sınıf',
    '4.Sınıf'
  ];

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
  late TextEditingController _controllerGPA;
  double gpa = 0.0;

  late TextEditingController _controllerDate;
  late TextEditingController _controllerUyruk;
  late TextEditingController _controllerAdres;
  late TextEditingController _controllerSirket;
  late TextEditingController _controllerOkul;
  late TextEditingController _controllerBolum;
  late TextEditingController _controllerHakkinda;

  @override
  void initState() {
    super.initState();
    _controllerDate = TextEditingController();
    _controllerUyruk = TextEditingController();
    _controllerAdres = TextEditingController();
    _controllerSirket = TextEditingController();
    _controllerOkul = TextEditingController();
    _controllerBolum = TextEditingController();
    _controllerHakkinda = TextEditingController();
    _controllerGPA = TextEditingController();
  }

  @override
  void dispose() {
    _controllerDate.dispose();
    _controllerUyruk.dispose();
    _controllerAdres.dispose();
    _controllerSirket.dispose();
    _controllerOkul.dispose();
    _controllerBolum.dispose();
    _controllerHakkinda.dispose();
    _controllerGPA.dispose();

    super.dispose();
  }

  void saveDataToDatabase() {
    // Get the GPA value as a string from _controllerGPA.text
    String gpaAsString = _controllerGPA.text;

    // Parse the GPA string to a double
    double gpa = double.tryParse(gpaAsString) ?? 0.0;

    // Use the gpa variable wherever you want to save or process the GPA value
    // Your database or other logic goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarWidget(),
        body: SingleChildScrollView(
          child: Center(
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
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("5 Bağlantı"),
                    Text("100 Firma"),
                    Text("14 Etiket"),
                  ],
                ),*/
                const SizedBox(
                  height: 15,
                ),
                _profilebuttons(context),
                const SizedBox(height: 20),
                //_pageValue == 0 ? _gonderilerBuilder() : _basvurularimBuilder()
                _pageValue == 0
                    ? _hakkimda_edit(context)
                    : _pageValue == 1
                        ? _basvurularimBuilder()
                        : _egitimBilgilerBuilderEdit()
              ],
            ),
          ),
        ));
  }

  Widget _hakkimda_edit(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return dropdownOptions.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList();
                },
                onSelected: (String selectedOption) {
                  // Handle the selected option
                  print('Selected Option: $selectedOption');
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: OurColor.firstColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: const Text(
                    'Cinsiyet Seçiniz',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerDate,
              decoration: InputDecoration(
                hintText: 'Doğum Tarihinizi Giriniz', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerAdres,
              decoration: InputDecoration(
                hintText: 'Adresnizi Giriniz', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerSirket,
              decoration: InputDecoration(
                hintText: 'Hangi Şirkete Çalışıyorsunuz', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Color.fromARGB(0, 38, 11, 214)),
                ),
              ),
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
        ],
      ),
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
      title: Center(child: Text("Edit Profil")),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          }),
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

  Widget _egitimBilgilerBuilderEdit() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerOkul,
              decoration: InputDecoration(
                hintText: 'Okul Adınız', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerBolum,
              decoration: InputDecoration(
                hintText: 'Bölümünüz', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return dropdownOptionsEgitim.map((String option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
              onSelected: (String selectedOption) {
                // Handle the selected option
                print('Selected Option: $selectedOption');
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: OurColor.firstColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.transparent),
                ),
                child: const Text(
                  'Sınıf Seçiniz',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 1,
              controller: _controllerGPA,
              decoration: InputDecoration(
                hintText: 'Ortalamanız', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              //maxLength: 20,
              maxLines: 1,
              controller: _controllerAdres,
              decoration: InputDecoration(
                hintText: 'Adresnizi Giriniz', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
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
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              maxLength: 250,
              maxLines: 1,
              controller: _controllerHakkinda,
              decoration: InputDecoration(
                hintText: 'Hankkınızda', // The hint text
                border: UnderlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Color.fromARGB(0, 38, 11, 214)),
                ),
              ),
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
        ],
      ),
    );
  }

  Widget _basvurularimBuilder() {
    return Container(child: Text("Henüz Başvurunuz Bulunmamaktadır"));
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

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
