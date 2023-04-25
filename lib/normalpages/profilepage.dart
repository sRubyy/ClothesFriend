import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed in as: ${user.email!}"),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.deepOrange,
              child: const Text("sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
