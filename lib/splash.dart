import 'dart:async';

import 'package:chatapp/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var _user;
  Future<void> isCurrentUser() async {
    _user = await FirebaseAuth.instance.currentUser;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignIn(
        onSignIn: (User? user) {
          updateUser(user);
        },
      );
    } else {
      return Home(
        onSignOut: () {
          updateUser(null);
        },
        userCredential: _user,
      );
    }
  }

  void updateUser(User? user) {
    setState(() {
      _user = user;
    });
  }
}
