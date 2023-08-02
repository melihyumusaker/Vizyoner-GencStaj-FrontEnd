import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proje/model/KullaniciModel.dart';
import 'package:proje/pages/auth/login/login.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';
import 'package:proje/pages/screens/is/is.dart';
import 'package:proje/pages/screens/profile/profile.dart';
import 'package:proje/pages/screens/publish_post_page/publish_post_page.dart';
import 'package:proje/pages/screens/sosyal/sosyal.dart';
import 'package:proje/service/get_kullanici_service.dart';
import 'package:proje/utils/themecolors/colors.dart';

//import 'package:fluter/proje/pages/screens'
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCWrR66Ic0b7uj7FBFxHHF68LTm1Twx4LE', // Your apiKey
      appId: '1:352405295079:android:e775fa34503b9b8852b742', // Your appId
      messagingSenderId: '352405295079', // Your messagingSenderId
      projectId: 'vizyonergenc-80bc2', // Your projectId
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    */
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //statusBarColor: Colors.transparent,
        systemNavigationBarColor: OurColor.firstColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  String email;
  BottomTabBar({Key? key, required this.email}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  KullaniciModel myKullanici = new KullaniciModel();

  Future<void> fetchUser() async {
    try {
      GetUserService service = GetUserService();
      KullaniciModel kullanici = await service.getOneUserByEmail(widget.email);

      setState(() {
        myKullanici = kullanici;
      });
    } catch (e) {
      print("hata :" + e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  int _index = 0;
  List<Widget> get screens {
    return [
      HomeScreen(
        email: widget.email,
      ),
      ProfilePage(email: widget.email, kullaniciId: myKullanici.kullaniciId!),
      PublishPost(email: widget.email),
      Sosyal(),
      Is(email: widget.email),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: screens[_index], bottomNavigationBar: bottomNavBar());
  }

  Widget bottomNavBar() {
    return Stack(children: [
      Container(
        height: 55,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [OurColor.secondColor, OurColor.firstColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 25],
          ),
        ),
      ),
      BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: OurColor.thirdColor,
          unselectedLabelStyle: TextStyle(color: OurColor.thirdColor),
          selectedIconTheme: IconThemeData(color: Colors.white, size: 27),
          selectedLabelStyle: TextStyle(color: Colors.white),
          fixedColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Yayınla',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Sosyal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'İş',
            )
          ]),
    ]);
  }
}
