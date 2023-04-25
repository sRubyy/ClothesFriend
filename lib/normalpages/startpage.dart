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
          //   decoration: BoxDecoration(color: Colors.orange[300]),
          //   alignment: Alignment.topCenter,
          //   child: Image.asset("assets/images/logo2.png", width: 200, height: 100),
          // ),
          Container(
            width: 350,
            height: 35,
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            padding: const EdgeInsets.only(left: 15, right: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                const TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Search ...",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.search, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: const Text("Shop by Product"),
          ),
          Container(
            child: Row(children: [
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(50, 40, 0, 0),
                child: const MyBox(
                  img: "assets/images/t-shirt.png",
                  text: 'T-Shirt',
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(60, 40, 0, 0),
                child: const MyBox(
                  img: 'assets/images/jacket.png',
                  text: 'Jacket',
                ),
              )
            ]),
          ),
          Container(
            child: Row(children: [
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                child: const MyBox(
                  img: 'assets/images/shorts.png',
                  text: 'Shorts',
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(60, 50, 0, 0),
                child: const MyBox(
                  img: 'assets/images/jeans.png',
                  text: 'Jeans',
                ),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: const Text("Popular Store"),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      "assets/images/store.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "เสื้อยืดมือสองbyหนึ่งศาลายา",
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "Salaya, Phutthamonthon District,\n Nakhon Pathom 73170",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Image.asset(
                      "assets/images/store.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "น้ำหนึ่ง เสื้อผ้าแฟชั่น มือสองเกรด A",
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "Salaya, Phutthamonthon District,\n Nakhon Pathom 73170",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ]),
      )),
    );
  }
}

class MyBox extends StatelessWidget {
  final String img;
  final String text;

  const MyBox({super.key, required this.img, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5)),
      width: 130,
      height: 100,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          width: 35,
          height: 35,
          child: Image.asset(img),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(text),
        )
      ]),
    );
  }
}
