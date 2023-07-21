import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proje/pages/hakkimizda/misyon.dart';
import 'package:proje/pages/hakkimizda/vizyon.dart';
import 'package:proje/themecolors/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Hakkimizda extends StatefulWidget {
  const Hakkimizda({super.key});

  @override
  State<Hakkimizda> createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  String adres = "Üniversiteler, ODTÜ Teknokent, 06800 Çankaya/Ankara";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBarWidget(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                _misyon(context),
                const SizedBox(height: 15),
                _vizyon(context),
                const SizedBox(height: 45),
                _bizeUlasWidget(),
                _mailAndPhoneContact(),
                const SizedBox(height: 45),
                _sosyalMedya(),
                _sosyalMedyaButtons(),
                const SizedBox(height: 35),
                const Divider(),
                _adresimizText(),
                _adresWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _adresimizText() {
    return Text(
      "Adresimiz",
      style: TextStyle(
          fontFamily: 'OpenSans', fontSize: 20, color: Colors.black54),
    );
  }

  GestureDetector _vizyon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Vizyon()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 1 / 15,
        width: MediaQuery.of(context).size.width * 3 / 9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                OurColor.thirdColor,
                OurColor.secondColor,
                OurColor.firstColor,
              ]),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Vizyonumuz",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _misyon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Misyon()));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 1 / 15,
        width: MediaQuery.of(context).size.width * 3 / 9,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                OurColor.firstColor,
                OurColor.secondColor,
                OurColor.thirdColor
              ]),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Misyonumuz",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Container _sosyalMedyaButtons() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final url = Uri.parse("https://www.instagram.com/vizyonergenc/");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(fit: BoxFit.fill, "assets/images/insta.png"),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final url =
                  Uri.parse("https://tr.linkedin.com/company/vizyonergenc");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Container(
              height: 48,
              width: 80,
              child: InkWell(
                child:
                    Image.asset(fit: BoxFit.fill, "assets/images/linkedin.png"),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final url = Uri.parse("https://twitter.com/vizyonergenccom");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset("assets/images/twitter.jpg"),
            ),
          )
        ],
      ),
    );
  }

  Text _sosyalMedya() {
    return const Text(
      "Sosyal Medya",
      style: TextStyle(
          fontFamily: 'OpenSans', fontSize: 20, color: Colors.black54),
    );
  }

  Container _mailAndPhoneContact() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              final Uri url = Uri(scheme: 'tel', path: "0312 424 19 62");
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                print("olmadı");
              }
            },
            child: Container(
              height: 50,
              width: 50,
              child: Image.asset("assets/images/phone.png"),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              final Uri emailUri =
                  Uri(scheme: 'mailto', path: "iletisim@vizyonergenc.com");

              if (await canLaunchUrl(emailUri)) {
                launchUrl(emailUri);
              } else {
                throw Exception('Could not launch $emailUri');
              }
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/images/mail.png"),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Text _bizeUlasWidget() {
    return const Text(
      "Bize Ulaşın",
      style: TextStyle(
          fontFamily: 'OpenSans', fontSize: 20, color: Colors.black54),
    );
  }

  Container _adresWidget() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListTile(
        leading: const Icon(Icons.home_filled),
        title: Text(
          adres,
          style: const TextStyle(fontSize: 15, fontFamily: 'OpenSans'),
        ),
      ),
    );
  }
}

AppBar _appBarWidget() {
  return AppBar(
    backgroundColor: OurColor.firstColor,
    title: Padding(
      padding: const EdgeInsets.only(right: 50),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Center(
          child: Text(
            'Hakkımızda',
            style: TextStyle(
                color: Colors.white, fontFamily: "OpenSans", fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
