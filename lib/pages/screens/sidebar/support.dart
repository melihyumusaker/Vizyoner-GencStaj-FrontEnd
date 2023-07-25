import 'package:flutter/material.dart';

class Destek extends StatefulWidget {
  const Destek({super.key});

  @override
  State<Destek> createState() => _DestekState();
}

class _DestekState extends State<Destek> {
  TextEditingController _controllerUserName = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();

  void initState() {
    super.initState();
    _controllerUserName.text = "Your Name!";
    _controllerEmail.text =
        "your_name@gmail.com"; // Metin alanına başlangıçta veri atama
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF182978),
        title: Text(
          "Bize Ulaşın",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 175,
                height: 175,
                margin: EdgeInsets.all(5),
                child: Image.asset("assets/images/vizyonergenc.png")),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yardıma mı ihtiyacın var ? ",
                  style: TextStyle(
                      color: Color(0xFF6688CC),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "Bize Ulaş ",
                  style: TextStyle(color: Color(0xFFACBFE6), fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
              child: TextField(
                enabled: false,
                controller: _controllerUserName,
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    isDense: true,
                    contentPadding: EdgeInsets.all(15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
              child: TextField(
                enabled: false,
                controller: _controllerEmail,
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    isDense: true,
                    contentPadding: EdgeInsets.all(15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    isDense: true,
                    contentPadding: EdgeInsets.all(15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 90.0, top: 8),
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.purple.shade900)),
                    isDense: true,
                    contentPadding: EdgeInsets.all(15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(

                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Butonun köşe yarıçapı
                    side: BorderSide(color: Color(0XFF182978), width: 5), // Kenarlık rengi ve kalınlığı
                  ),
                ),
                  backgroundColor: MaterialStatePropertyAll(Color(0XFF182978)),
                ),
                child: Text(
                  "Gönder",
                  style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: "OpenSans"),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
