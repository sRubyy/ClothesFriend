import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectapp/normalpages/homepage.dart';
import 'package:projectapp/normalpages/shoplist.dart';

import 'normalpages/loginpage.dart';
import 'normalpages/registerpage.dart';
import 'normalpages/mappage.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login':(context) => LoginPage(),
        '/regis':(context) => RegisterPage(),
        '/home':(context) => HomePage(),
        '/map':(context) => MapSample(),
        '/shoplist':(context) => ShopList(),
      },
    );
  }
}