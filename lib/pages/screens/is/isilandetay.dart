import 'package:flutter/material.dart';
import 'package:proje/themecolors/colors.dart';

class IsIlanDetay extends StatelessWidget {
  const IsIlanDetay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColor.bgColor,
      appBar: _ilanDetayAppBar(context),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          color: OurColor.thirdColor,
          elevation: 50,
          child: Column(
            children: [
              _logo(),
              _ilanNameText(),
              _firmaNameText(),
              _adresText(),
              _tarihText(),
              _icerikText(),
              _basvurButton(context),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Container _basvurButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      width: (MediaQuery.of(context).size.width - 100) / 2,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: OurColor.secondColor,
          foregroundColor: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Text("Başvur"),
      ),
    );
  }

  Padding _icerikText() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  Text _tarihText() {
    return const Text(
      "Tarih",
      style: TextStyle(
          fontFamily: "OpenSans", color: Colors.black45, fontSize: 18),
    );
  }

  Padding _adresText() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Adres",
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black54, fontSize: 18),
      ),
    );
  }

  Padding _firmaNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Text(
        "Firma Adı",
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  Padding _ilanNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        "İlan adi",
        style: TextStyle(
            fontFamily: "OpenSans", color: Colors.black, fontSize: 18),
      ),
    );
  }

  SizedBox _logo() {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.asset("assets/images/facebook.jpg"),
    );
  }

  AppBar _ilanDetayAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: OurColor.firstColor,
      title: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: ListTile(
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
              'İlan Detayı',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSans",
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String text =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt sagittis luctus. Vivamus quis libero condimentum quam bibendum pretium. Quisque a tellus porttitor dolor fringilla fringilla. Ut non posuere quam, in sodales lorem. Cras varius elementum urna, ac rutrum sem pellentesque non. Aenean condimentum leo at porttitor pellentesque. Mauris ultricies massa consequat massa dignissim, eu luctus leo varius. Sed vel bibendum nisl, vel maximus sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In pretium dui malesuada elit maximus pretium. Morbi bibendum quam eget nunc dapibus, quis faucibus lorem elementum.";
