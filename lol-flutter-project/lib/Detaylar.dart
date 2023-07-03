import 'dart:ui';

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lolproje/Bandle.dart';
import 'package:lolproje/Kartlar.dart';
import 'package:lolproje/sampiyon.dart';

import 'Bandle.dart';
import 'Bilgewater.dart';
import 'Yetenekler.dart';
import 'data.dart';

class Detaylar extends StatefulWidget {
  final Champion champion;
  const Detaylar({this.champion});
  @override
  _DetailViewState createState() => _DetailViewState(champion: champion);
}

int listkontrol = 0;
int listarttirma = 0;
int sayi = 3;
List<String> karakterlerlist = [
  "",
  "",
  "",
];
List<String> kumelist = [
  "DEMİR 4:",
  "DEMİR 3:",
  "DEMİR 2:",
  "DEMİR 1:",
  "BRONZ 4:",
  "BRONZ 3:",
  "BRONZ 2:",
  "BRONZ 1:",
  "SİLVER 4:",
  "SİLVER 3:",
  "SİLVER 2:",
  "SİLVER 1:",
  "GOLD 4:",
  "GOLD 3:",
  "GOLD 2:",
  "GOLD 1:",
  "ALTIN 4:",
  "ALTIN 3:",
  "ALTIN 2:",
  "ALTIN 1:",
  "PLATİN 4:",
  "PLATİN 3:",
  "PLATİN 2:",
  "PLATİN 1:",
  "ELMAS 4:",
  "ELMAS 3:",
  "ELMAS 2:",
  "ELMAS 1:",
  "MASTER 4:",
  "MASTER 3:",
  "MASTER 2:",
  "MASTER 1:",
  "GRANDMASTER:",
  "CHALLENGER:",
];
int kumeresim = 1;
int toplampuan = 0;
int arapuan = 100;
int kumearttirma = 0;
int challenger = 0;
int karakterpuan = 0;
int kp = 0;
List<Widget> gifpuan0 = [];
List<Widget> gifpuan1 = [
  Rioticon,
];
List<Widget> gifpuan2 = [
  Rioticon,
  Rioticon,
];
List<String> sampiyonismi = ["", "", ""];
List<int> sampiyonpuani = [0, 0, 0];
int puan = 0;
int sampiyonpuan;
int degisen = 0;
int gf = 0;
int gifpuan = 0;

class _DetailViewState extends State<Detaylar> with TickerProviderStateMixin {
  String kapali = 'OYNA';
  String giris = '';
  final Champion champion;
  Color rengi = Colors.white;
  _DetailViewState({
    this.champion,
  });

  bool init = false;

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    Tween<double> tween = Tween(begin: 0.0, end: 400.0);

    animation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInExpo))
          ..addListener(() {
            setState(() {});
          });

    controller.forward();

    if (sampiyonismi.any((s) => s.contains('${champion.isim}')) == false) {
      sampiyonismi[degisen] = champion.isim;
      sampiyonpuani[degisen] = 0;
      sampiyonpuan = 0;
      degisen = degisen + 1;
      veri().kaydedilenler();
    }
    for (num i = 0; i < degisen; i++) {
      if (sampiyonismi[i] == champion.isim) {
        sampiyonpuan = sampiyonpuani[i];
        print(sampiyonpuani[0]);
        print(sampiyonpuani[1]);
        print(sampiyonismi[0]);
        print(sampiyonismi[1]);
        veri().kaydedilenler();
      }
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (puan >= 100 && challenger == 0) {
          toplampuan = toplampuan + puan;
          puan = puan - arapuan;
          kumearttirma = kumearttirma + 1;
        }
        if (puan < 0 && kumearttirma == 0) {
          toplampuan == 0;
          puan = puan - puan;
        }
        if (puan < 0 && kumearttirma > 0) {
          toplampuan = toplampuan + puan;
          puan = puan + arapuan;
          kumearttirma = kumearttirma - 1;
        }
        if (kumearttirma < 0) {
          kumearttirma == 0;
        }
        if (toplampuan <= 400) {
          kumeresim = 1;
        } else if (toplampuan >= 400 && toplampuan < 800) {
          kumeresim = 2;
        } else if (toplampuan >= 800 && toplampuan < 1200) {
          kumeresim = 3;
        } else if (toplampuan >= 1200 && toplampuan < 1600) {
          kumeresim = 4;
        } else if (toplampuan >= 1600 && toplampuan < 2000) {
          kumeresim = 5;
        } else if (toplampuan >= 2400 && toplampuan < 2800) {
          kumeresim = 6;
        } else if (toplampuan >= 2800 && toplampuan < 3200) {
          kumeresim = 7;
        } else if (toplampuan >= 3200) {
          kumeresim = 8;
          puan = challenger + puan;
          kumearttirma = 33;
        }

        init = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
        Hero(
          tag: champion.isim.toUpperCase(),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [backgroundColor, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              sampiyonpuan == 0
                  ? "assets/gifler/${champion.isim.toLowerCase()}.jpg"
                  : sampiyonpuan <= 3
                      ? "assets/gifler/${champion.isim.toLowerCase()}.png"
                      : sampiyonpuan == 4
                          ? "assets/gifler/${champion.isim.toLowerCase()}.gif"
                          : "assets/gifler/${champion.isim.toLowerCase()}.jpg",
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 5, top: 45),
                child: CustomBackButton()),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 180, top: 45),
                  child: Row(
                    children: [
                      Text(
                        "${kumelist[kumearttirma]}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: backgroundColor,
                        backgroundImage:
                            AssetImage('assets/kumeler/kume${kumeresim}.png'),
                        child: Text('${puan}'),
                      )
                    ],
                  )),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  width: double.infinity,
                  height: 320,
                  child: Stack(
                    children: [
                      AnimatedBorder(animation: animation),
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedOpacity(
                          opacity: init ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  "assets/roller/${champion.rol.toString().split(".")[1].toLowerCase()}.png",
                                                  width: 40,
                                                  height: 40),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text("ROLE",
                                                  style: textTheme.headline3),
                                              Text(
                                                  champion.rol
                                                      .toString()
                                                      .split(".")[1],
                                                  style: textTheme.headline3
                                                      .copyWith(
                                                          color: Color(
                                                              0xffAE914B)))
                                            ]),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 40,
                                              child: Center(
                                                child: DifficultyGraph(
                                                    count: widget
                                                        .champion.zorluk.index),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "DIFFICULTY",
                                              style: textTheme.headline3,
                                            ),
                                            Text(
                                                champion.zorluk
                                                    .toString()
                                                    .split(".")[1]
                                                    .toUpperCase(),
                                                style: textTheme.headline3
                                                    .copyWith(
                                                        color:
                                                            Color(0xffAE914B)))
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 30),
                                      child: Text(champion.hikaye,
                                          style: textTheme.bodyText1,
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis),
                                    )
                                  ])),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: init ? 1.0 : 0.0,
            child: Container(
              margin: EdgeInsets.only(bottom: 185),
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      champion.isim.toUpperCase(),
                      style: textTheme.headline1.copyWith(
                          letterSpacing:
                              4 + 25 * ((400 - animation.value) / 400.0)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/lolkarakter.jpg'),
                          child: Text('${sayi.toInt()}'),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(primary: rengi),
                      onPressed: () {
                        if (karakterlerlist.any((dogru) =>
                                        dogru.contains('${champion.isim}')) ==
                                    true &&
                                kapali == 'OYNA' ||
                            kapali == 'HERO AÇILDI') {
                          setState(() {
                            sayilar[13] = kumearttirma.toDouble() + 24;
                            sayilar[8] = 60 + gf.toInt();
                            sayilar[4] = kp.toDouble() + 6;
                            sayilar[0] = 0;
                            sayilar[1] = 0;
                            sayilar[2] = 0;
                            sayilar[3] = 0;
                            sayilar[5] = 0;
                            sayilar[6] = 0;
                            sayilar[7] = 0;
                            sayilar[9] = 0;
                            sayilar[10] = 0;
                            sayilar[11] = 0;
                            sayilar[12] = 0;
                            sayilar[14] = 0;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => yetenekler()),
                            );
                          });
                        } else if (sayi >= 1 &&
                            kapali != 'HERO AÇILDI' &&
                            kapali != 'YETERLİ PUAN YOK' &&
                            kapali != 'GİRİŞ YAPILDI') {
                          setState(() {
                            sayi = sayi - 1;
                            giris = champion.isim;
                            kapali = 'HERO AÇILDI';
                            rengi = Colors.red;
                            karakterlerlist[listarttirma] = champion.isim;
                            listarttirma = listarttirma + 1;
                            karakterpuan = karakterpuan + 1;
                            veri().kaydedilenler();
                          });
                          setState(() {
                            if (sampiyonpuan <= 0) {
                              for (num i = 0; i < degisen; i++) {
                                if (sampiyonismi[i] == champion.isim) {
                                  sampiyonpuani[i] = sampiyonpuani[i] + 1;
                                  sampiyonpuan = sampiyonpuani[i];
                                }
                              }
                              if (bilgewaterisim.any((bilgedogru) => bilgedogru
                                      .contains('${champion.isim}')) ==
                                  true) {
                                for (num i = 0;
                                    i < bilgewaterisim.length;
                                    i++) {
                                  if (bilgewaterisim[i] == champion.isim) {
                                    bilgewaterpuan[i] = 1;
                                  }
                                }
                              }
                              if (bandleisim.any((bandledogru) => bandledogru
                                      .contains('${champion.isim}')) ==
                                  true) {
                                for (num i = 0; i < bandleisim.length; i++) {
                                  if (bandleisim[i] == champion.isim) {
                                    bandlepuan[i] = 1;
                                  }
                                }
                              }
                            }
                          });
                          if (karakterpuan >= 10) {
                            karakterpuan = karakterpuan - 10;
                            kp = kp + 1;
                          }
                        } else if (sayi <= 0 &&
                            kapali != 'HERO AÇILDI' &&
                            kapali != 'GİRİŞ YAPILDI') {
                          setState(() {
                            kapali = 'YETERLİ PUAN YOK';
                            rengi = Colors.black;
                          });
                        }
                      },
                      child: Text(
                        '$kapali',
                        style: TextStyle(
                            color: rengi,
                            fontSize: 40,
                            letterSpacing:
                                4 + 25 * ((400 - animation.value) / 400.0)),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          sampiyonpuan == 0
                              ? TextButton(
                                  style: TextButton.styleFrom(),
                                  onPressed: null,
                                  child: Text(
                                    'karakteri acınız',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                )
                              : gifpuan > 0 && sampiyonpuan < 4
                                  ? TextButton(
                                      style: TextButton.styleFrom(),
                                      onPressed: () {
                                        setState(() {
                                          gf = gf + 1;
                                          gifpuan = gifpuan - 1;
                                          for (num i = 0; i < degisen; i++) {
                                            if (sampiyonismi[i] ==
                                                champion.isim) {
                                              sampiyonpuani[i] =
                                                  sampiyonpuani[i] + 1;
                                              sampiyonpuan = sampiyonpuani[i];
                                            }
                                          }
                                          if (bilgewaterisim.any((bilgedogru) =>
                                                  bilgedogru.contains(
                                                      '${champion.isim}')) ==
                                              true) {
                                            for (num i = 0;
                                                i < bilgewaterisim.length;
                                                i++) {
                                              if (bilgewaterisim[i] ==
                                                  champion.isim) {
                                                bilgewaterpuan[i] =
                                                    bilgewaterpuan[i] + 1;
                                              }
                                            }
                                          }
                                          if (bandleisim.any((bandledogru) =>
                                                  bandledogru.contains(
                                                      '${champion.isim}')) ==
                                              true) {
                                            for (num i = 0;
                                                i < bandleisim.length;
                                                i++) {
                                              if (bandleisim[i] ==
                                                  champion.isim) {
                                                bandlepuan[i] =
                                                    bandlepuan[i] + 1;
                                              }
                                            }
                                          }
                                        });
                                      },
                                      child: Text(
                                        'GF PUAN=$gifpuan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    )
                                  : gifpuan <= 0
                                      ? TextButton(
                                          style: TextButton.styleFrom(),
                                          onPressed: null,
                                          child: Text(
                                            'GF PUAN YOK',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                            ),
                                          ),
                                        )
                                      : Text("")
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: sampiyonpuan == 2
                          ? gifpuan1
                          : sampiyonpuan == 3
                              ? gifpuan2
                              : gifpuan0,
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class DifficultyGraph extends StatelessWidget {
  final count;
  const DifficultyGraph({this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Parallelogram(
        cutLength: 10.0,
        edge: Edge.RIGHT,
        child: Container(
          color: difficultyEnableColor,
          width: 25.0,
          height: 10.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 16),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 0 ? difficultyEnableColor : difficultyDisableColor,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 32),
        child: Parallelogram(
          cutLength: 10.0,
          edge: Edge.RIGHT,
          child: Container(
            color: count > 1 ? difficultyEnableColor : difficultyDisableColor,
            width: 25.0,
            height: 10.0,
          ),
        ),
      ),
    ]);
  }
}

class AnimatedBorder extends StatelessWidget {
  const AnimatedBorder({
    @required this.animation,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: MyPainter(value: animation.value),
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          );
        },
      );
    });
  }
}

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey[100].withOpacity(0.3),
        child: InkWell(
          child: SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double value;

  MyPainter({this.value});

  final paintBorder = Paint()
    ..color = Colors.white30
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  final transparentBorder = Paint()
    ..color = Colors.transparent
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    if (value < 15) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width * 15 / 100, 0);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width * 15 / 100, 0);

    if (value >= 15 && value <= 85) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, transparentBorder);
      return;
    } else {
      path.lineTo(size.width * 85 / 100, 0);
      canvas.drawPath(path, transparentBorder);
    }

    path = Path();
    path.moveTo(size.width * 85 / 100, 0);

    if (value > 85 && value < 100) {
      double lineValue = size.width * value / 100;
      path.lineTo(lineValue, 0);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, 0);
      canvas.drawPath(path, paintBorder);
    }

    if (value < 200) {
      double lineValue = size.height * (value - 100) / 100;
      path.lineTo(size.width, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(size.width, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(size.width, size.height);

    if (value < 300) {
      double lineValue = size.width - size.width * (value - 200) / 100;
      path.lineTo(lineValue, size.height);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, size.height);
      canvas.drawPath(path, paintBorder);
    }

    path = Path();
    path.moveTo(0, size.height);

    if (value < 400) {
      double lineValue = size.height - size.height * (value - 300) / 100;
      path.lineTo(0, lineValue);
      canvas.drawPath(path, paintBorder);
      return;
    } else {
      path.lineTo(0, 0);
      canvas.drawPath(path, paintBorder);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

var Rioticon = CircleAvatar(
  backgroundImage: AssetImage('assets/images/punch.png'),
);
