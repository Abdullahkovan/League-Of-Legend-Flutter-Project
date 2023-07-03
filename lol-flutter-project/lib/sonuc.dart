import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lolproje/main.dart';
import 'package:lolproje/sampiyon.dart';

import 'Detaylar.dart';
import 'SoruSayfası.dart';
import 'data.dart';

class sonuc extends StatefulWidget {
  final Champion champion;
  const sonuc({this.champion});
  @override
  _sonucState createState() => _sonucState(champion: champion);
}

class _sonucState extends State<sonuc> {
  final Champion champion;
  Color rengi = Colors.white;
  _sonucState({
    this.champion,
  });
  @override
  Widget build(BuildContext context) {
    if (sonucgosterge[2] < 0) {
      sonucgosterge[2] = 0 - sonucgosterge[2];
    }
    ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/arkaplan2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 70, left: 40, right: 40, bottom: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                    child: Container(
                        child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "OYUN BİTTİ",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    sonuclistTile(
                      "${sonucgosterge[22 + 1]}",
                      sonucgosterge[22],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[24 + 1]}",
                      sonucgosterge[24],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[26 + 1]}",
                      sonucgosterge[26],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[28 + 1]}",
                      sonucgosterge[28],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[30 + 1]}",
                      sonucgosterge[30],
                      Colors.red,
                      Colors.white,
                      Colors.green,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[0 + 1]}",
                      sonucgosterge[0],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[2 + 1]}",
                      sonucgosterge[2],
                      Colors.red,
                      Colors.white,
                      Colors.green,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[4 + 1]}",
                      sonucgosterge[4],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[6 + 1]}",
                      sonucgosterge[6],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[8 + 1]}",
                      sonucgosterge[8],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[10 + 1]}",
                      sonucgosterge[10],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[12 + 1]}",
                      sonucgosterge[12],
                      Colors.red,
                      Colors.white,
                      Colors.green,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[14 + 1]}",
                      sonucgosterge[14],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[16 + 1]}",
                      sonucgosterge[16],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[18 + 1]}",
                      sonucgosterge[18],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    sonuclistTile(
                      "${sonucgosterge[20 + 1]}",
                      sonucgosterge[20],
                      Colors.green,
                      Colors.white,
                      Colors.red,
                    ),
                    ListTile(
                      title: Text(
                        "KAZANILAN DERECE PUANI:$Derecepuan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: TextButton(
                          style: TextButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            if (Derecepuan > 0) {
                              gifpuan = gifpuan + 1;
                              veri();
                            }
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loluyg()),
                              );
                            });

                            ;
                          },
                          child: Text(
                            'Karakterler',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListTile sonuclistTile(
      String yazi, int sayi, Color renk1, Color renk2, Color renk3) {
    return ListTile(
      title: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(0),
          color: sayi > 0
              ? renk1
              : sayi == 0
                  ? renk2
                  : renk3,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              "$yazi" "$sayi",
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 1,
        ),
      ),
      tileColor: Colors.red,
    );
  }
}
