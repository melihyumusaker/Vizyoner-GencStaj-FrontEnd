import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF182978),
        title: Text("Bildirimler",
            style: TextStyle(
              fontSize: 20,
            )),
      ),
      body: ListView(
        //height: double.infinity,
        children: [
          _ListTileMethod("Asuman Kiper", "bağlantı isteğini kabul etti."),
          Divider(),
        ],
      ),
    );
  }

  ListTile _ListTileMethod(String kullaniciAdi, String subtitle) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundColor: Color(0xACBFE6),
        radius: 25,
        backgroundImage: AssetImage('assets/images/circlee.jpg'),
      ),
      title: Text(
        kullaniciAdi.toUpperCase(),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
