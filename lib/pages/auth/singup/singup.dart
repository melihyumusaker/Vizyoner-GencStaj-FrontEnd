import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/main.dart';
import 'package:proje/pages/auth/login/login.dart';
import 'package:proje/service/signup_service.dart';
import 'package:proje/utils/reuseable_widgets/auth_reuseable_widgets.dart';
import 'package:proje/utils/themecolors/colors.dart';


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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Adınızı Giriniz",
                      Icons.person_outline, false, _firstNameTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Soyadınızı Giriniz",
                      Icons.person_outline, false, _lastNameTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Mailinizi Giriniz",
                      Icons.email_outlined, false, _emailTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Şifrenizi Giriniz",
                      Icons.lock_outlined, true, _passwordTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Kayıt Ol", () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Kayıt'),
                          content: Text("Kayıt Başarılı"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Kapat"))
                          ],
                        );
                      });

                  SignupService.sendDataToServer(
                      _firstNameTextController.text,
                      _lastNameTextController.text,
                      _emailTextController.text,
                      _passwordTextController.text);
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
              ],
            ),
          ))),
    );
  }
}
