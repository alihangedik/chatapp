import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key, required this.onSignIn});
  final Function(User?) onSignIn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ChatsApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: PageView(
        children: [
          signInPage(),
          signUpPage(),
        ],
      ),
    );
  }

  Column signUpPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/hero2.png',
          scale: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: 25),
          ),
        ),
        SignInMethodButton(
          text: 'Google ile kayıt ol',
        ),
        SignInMethodButton(
          text: 'Email ile kayıt ol',
        ),
      ],
    );
  }

  Column signInPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/hero.png',
          scale: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Text(
            'Oturum Aç',
            style: TextStyle(fontSize: 25),
          ),
        ),
        SignInMethodButton(
          text: 'Google ile giriş yap',
        ),
        SignInMethodButton(
          text: 'Email ile giriş yap',
        ),
        SignInMethodButton(
          text: 'Misafir olarak giriş yap',
          onTap: () {
            anonymous();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kayıt olmak için yana kaydırın'),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_circle_right,
                color: Colors.pink,
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> anonymous() async {
    UserCredential user = await FirebaseAuth.instance.signInAnonymously();
    onSignIn(user.user);

    log(user.user!.uid.toString());
  }
}

class SignInMethodButton extends StatelessWidget {
  const SignInMethodButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
