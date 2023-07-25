import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.userCredential,
    required this.onSignOut,
  });
  final User? userCredential;
  final VoidCallback onSignOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: signOut,
              child: Text(
                'Çıkış yap',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Center(
          child: Text(
        'isAnonymous: ${userCredential!.isAnonymous.toString()}\n uId: ${userCredential!.uid}',
        textAlign: TextAlign.center,
      )),
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    onSignOut();
  }
}
