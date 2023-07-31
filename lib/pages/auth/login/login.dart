import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/main.dart';
import 'package:proje/pages/auth/singup/singup.dart';
import 'package:proje/pages/screens/home_screen/home_page.dart';
import 'package:proje/service/login_service.dart';

import '../../../utils/reuseable_widgets/auth_reuseable_widgets.dart';
import '../reset_password/reset_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool _girisBasarili = false;
    final LoginService loginService = new LoginService();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 236, 239, 246),
          // ignore: use_full_hex_values_for_flutter_colors
          Color.fromARGB(246, 90, 129, 206),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                3, MediaQuery.of(context).size.height * 0.1, 3, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: 250,
                  child: const Image(
                    image: NetworkImage(
                        "https://vizyonergenc.com/company/vg800600.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Mailinizi Giriniz",
                      Icons.person_outline, false, _emailTextController),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: reusableTextField("Şifrenizi Giriniz",
                      Icons.lock_outline, true, _passwordTextController),
                ),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Giriş Yap", () async {
                  bool sonuc = await loginService.loginKullanici(
                      _emailTextController.text, _passwordTextController.text);

                  setState(() {
                    _girisBasarili = sonuc;
                  });
                  debugPrint(_girisBasarili.toString());

                  if (_girisBasarili == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomTabBar(
                                  email: _emailTextController.text,
                                )));
                  }

                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      )
                      .then((value) {})
                      .onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hesabınız yok mu?",
            style: TextStyle(color: Color(0xFFACBFE6))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Signup()));
          },
          child: const Text(
            " Kayıt ol",
            style: TextStyle(
                color: Color(0xFFACBFE6), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Şifremi Unuttum",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
