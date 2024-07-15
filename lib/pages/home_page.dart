import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // this user
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
