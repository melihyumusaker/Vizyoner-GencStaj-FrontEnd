import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/pages/auth/login/login.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';

import '../../../themecolors/colors.dart';
import '../../../utils/reuseable_widgets/auth_reuseable_widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: OurColor.firstColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
        ),
        elevation: 0,
        title: const Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(246, 90, 129, 206),
            Color.fromARGB(255, 236, 239, 246),
            // ignore: use_full_hex_values_for_flutter_colors
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Adınızı Giriniz", Icons.person_outline,
                    false, _firstNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Soyadınızı Giriniz", Icons.person_outline,
                    false, _lastNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Mailinizi Giriniz", Icons.email_outlined,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Şifrenizi Giriniz", Icons.lock_outlined,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Kayıt Ol", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ))),
    );
  }
}
