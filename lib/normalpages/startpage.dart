import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Center(
          child: Column(children: <Widget>[
          // Container(
          //   width: 350,
          //   height: 35,
          //   margin: const EdgeInsets.only(top: 15, bottom: 15),
          //   padding: const EdgeInsets.only(left: 15, right: 7),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(25),
          //     border: Border.all(color: Colors.black),
          //   ),
          //   child: Stack(
          //     children: [
          //       const TextField(
          //         style: TextStyle(color: Colors.black),
          //         decoration: InputDecoration(
          //           hintText: "Search ...",
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.centerRight,
          //         child: IconButton(
          //           icon: const Icon(Icons.search, size: 20),
          //           onPressed: () {},
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: const Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(20, 1, 0, 0),
            child: const Text(
              "ClothesFriend",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "ClothesFriends is an application that allows you to get the location of a second-hand clothes shop and share the new shop location that you like with other people.",
                style: TextStyle(
                  color: Color.fromARGB(255, 239, 108, 0),
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            height: 450,
            width: 348,
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.asset(
              'assets/images/home_img3.jpg',
            ),
          ),
        ]),
      )),
    );
  }
}