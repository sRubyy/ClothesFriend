import 'package:flutter/material.dart';
import 'package:projectapp/normalpages/loginpage.dart';

import '../normalpages/registerpage.dart';

class AuthenPage extends StatefulWidget {
  const AuthenPage({super.key});

  @override
  State<AuthenPage> createState() => _AuthenPageState();
}

class _AuthenPageState extends State<AuthenPage> {

  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage();
    }else{
      return RegisterPage();
    }
  }
}