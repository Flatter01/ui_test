import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/setting-4.png"),
            const Icon(Icons.settings),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
