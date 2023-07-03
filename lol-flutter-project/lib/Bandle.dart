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
      title: 'BANDLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'lol',
        textTheme: textTheme,
      ),
      home: bandle(),
    );
  }
}

List<String> bandleisim = ["Poppy", "Tristana"];
List<int> bandlepuan = [
  0, //Poppy
  0, //Tristana
];

class bandle extends StatefulWidget {
  @override
  _bandleState createState() => _bandleState();
}

final List<String> Bandle = ["Poppy", "Tristana"];

class _bandleState extends State<bandle> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> Resim = [
      sampiyonmakro().bandlesampiyonlar(
          bandlepuan[0] == 0
              ? "assets/gifler/poppy.jpg"
              : bandlepuan[0] <= 3
                  ? "assets/gifler/poppy.png"
                  : bandlepuan[0] == 4
                      ? "assets/gifler/poppy.gif"
                      : "assets/gifler/poppy.jpg",
          "Poppy"),
      sampiyonmakro().bandlesampiyonlar(
          bandlepuan[1] == 0
              ? "assets/gifler/tristana.jpg"
              : bandlepuan[1] <= 3
                  ? "assets/gifler/tristana.png"
                  : bandlepuan[1] == 4
                      ? "assets/gifler/tristana.gif"
                      : "assets/gifler/tristana.jpg",
          "Tristana"),
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
                  titles: Bandle,
                  images: Resim,
                  onPageChanged: (page) {
                    // print(page);
                  },
                  onSelectedItem: (index) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detaylar(
                                champion:
                                    bandleMap[Bandle[index].toLowerCase()],
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
