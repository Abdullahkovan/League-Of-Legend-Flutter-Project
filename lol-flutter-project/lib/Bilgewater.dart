import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lolproje/Detaylar.dart';
import 'package:lolproje/Kartlar.dart';
import 'package:lolproje/sampiyon.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'Detaylar.dart';
import 'Sampiyonmakro.dart';
import 'sampiyon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilgewater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'lol',
        textTheme: textTheme,
      ),
      home: bilgewater(),
    );
  }
}

List<String> bilgewaterisim = ["Akali"];
List<int> bilgewaterpuan = [
  0, //akali
];
List<String> isim = [];

class bilgewater extends StatefulWidget {
  @override
  _bilgewaterState createState() => _bilgewaterState();
}

class _bilgewaterState extends State<bilgewater> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Akali",
    ];

    final List<Widget> images = [
      sampiyonmakro().bandlesampiyonlar(
          bilgewaterpuan[0] == 0
              ? "assets/gifler/akali.jpg"
              : bilgewaterpuan[0] <= 3
                  ? "assets/gifler/akali.png"
                  : bilgewaterpuan[0] == 4
                      ? "assets/gifler/akali.gif"
                      : "assets/gifler/akali.jpg",
          "Akali"),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Center(
                    child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  // textStyle: TextStyle(color : Colors.red),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detaylar(
                                champion:
                                    BilgewaterMap[titles[index].toLowerCase()],
                              )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
