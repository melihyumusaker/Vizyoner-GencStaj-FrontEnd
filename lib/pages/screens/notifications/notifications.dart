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
          _ListTileMethod("Asuman Kiper", "bağlantı isteğini kabul etti." ,"2 saat önce"),
          Divider(),
          _ListTileMethod("Emine Betül Erdoğan", "sizinle bağlantı kurmak istiyor." ,"7 saat önce"),
          Divider(),
          
        ],
      ),
    );
  }

  ListTile _ListTileMethod(String kullaniciAdi, String subtitle , String date) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(        backgroundColor: Color(0xACBFE6),
        radius: 25,
        backgroundImage: AssetImage('assets/images/circlee.jpg'),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min,),
      title: Text(
        kullaniciAdi.toUpperCase(),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),

      
    );
  }
}
