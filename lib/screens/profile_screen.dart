import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: const Center(
        child: Text(
          "Votre profil utilisateur 👤",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
