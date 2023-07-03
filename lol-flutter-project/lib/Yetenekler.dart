import 'package:flutter/material.dart';

import 'Detaylar.dart';
import 'NeiseYarar.dart';
import 'SoruSayfası.dart';

class yetenekler extends StatefulWidget {
  @override
  _Yetenekler createState() => _Yetenekler();
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

Color minyoncarpan = Colors.white;
Color killcarpan = Colors.white;
Color olumcarpan = Colors.white;
Color assistcarpan = Colors.white;
Color sans = Colors.white;
Color karakterler = Colors.white;
Color tecrube = Colors.white;
Color minyon = Colors.white;
Color safe = Colors.white;
Color kill = Colors.white;
Color assist = Colors.white;
Color kule = Colors.white;
Color solorenk = Colors.red;
Color midrenk = Colors.red;
Color junglerenk = Colors.red;
Color adcrenk = Colors.red;
Color supportrenk = Colors.red;
List<num> sayilar = [
  0,
  0,
  0,
  0,
  10,
  0,
  0,
  0,
  60,
  0,
  0,
  0,
  0,
  0,
  0,
];
String mevki = "";
num yeteneksayi = 0;

class _Yetenekler extends State<yetenekler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gifler/arkaplan.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45, left: 10),
                  child: CustomBackButton(),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 45,
                      ),
                      child: TextButton(
                          onPressed: () {
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
                              minyoncarpan = Colors.white;
                              killcarpan = Colors.white;
                              olumcarpan = Colors.white;
                              assistcarpan = Colors.white;
                              sans = Colors.white;
                              karakterler = Colors.white;
                              tecrube = Colors.white;
                              minyon = Colors.white;
                              safe = Colors.white;
                              kill = Colors.white;
                              kule = Colors.white;
                              assist = Colors.white;
                            });
                          },
                          child: Text(
                            "PUANLARI SIFIRLA",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ))),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 45,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => wiki()),
                            );
                          });
                        },
                        child: Text(
                          "NE İŞE YARAR?",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ),
              ],
            )),
            Tema(
                BorderRadius.circular(0),
                Column(
                  children: [
                    butonlar(
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Row(children: [
                            kutular("assets/images/minyon1.png",
                                '${sayilar[0].toInt()}', "minyon", minyon),
                            kutular("assets/images/safe.png",
                                '${sayilar[1].toInt()}', "safe", safe),
                            kutular("assets/images/agresif.png",
                                '${sayilar[2].toInt()}', "kill", kill),
                            kutular("assets/images/agresif.png",
                                '${sayilar[14].toInt()}', "assist", assist),
                          ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: Text('KALAN KP:${sayilar[4].toInt()}',
                                style: TextStyle(fontSize: 15)))),
                  ],
                )),
            Tema(
                BorderRadius.circular(0),
                Column(
                  children: [
                    butonlar(
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Row(children: [
                            kutular("assets/images/sans.png",
                                '${sayilar[5].toInt()}', "sans", sans),
                            kutular("assets/images/tecrübe.png",
                                '${sayilar[6].toInt()}', "tecrübe", tecrube),
                            kutular(
                                "assets/images/karakter.png",
                                '${sayilar[7].toInt()}',
                                "karakterler",
                                karakterler),
                            kutular("assets/images/kule.png",
                                '${sayilar[3].toInt()}', "kule", kule),
                          ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: Text('KALAN GP:${sayilar[8].toInt()}',
                                style: TextStyle(fontSize: 15)))),
                  ],
                )),
            Tema(
                BorderRadius.circular(0),
                Column(
                  children: [
                    butonlar(
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(children: [
                          kutular(
                              "assets/images/minyoncarpan.png",
                              '${sayilar[9].toInt()}',
                              "minyoncarpan",
                              minyoncarpan),
                          kutular(
                              "assets/images/killcarpanı.png",
                              '${sayilar[10].toInt()}',
                              "killcarpan",
                              killcarpan),
                          kutular(
                              "assets/images/assist.png",
                              '${sayilar[11].toInt()}',
                              "assistcarpan",
                              assistcarpan),
                          kutular(
                              "assets/images/ölüm.png",
                              '${sayilar[12].toInt()}',
                              "ölümcarpan",
                              olumcarpan),
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                            left: 10,
                          ),
                          child: Text(
                            'KALAN DP:${sayilar[13].toInt()}',
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                  ],
                )),
            mevkiler(),
            Container(
                width: 150,
                height: 70,
                margin: EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (solorenk == Colors.red &&
                              midrenk == Colors.red &&
                              junglerenk == Colors.red &&
                              adcrenk == Colors.red &&
                              supportrenk == Colors.red) {
                            showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                    title: new Text("LANE SECİLMEDİ!"),
                                    content: new Text(
                                        "SİHİRDAR VADİSİ DIŞINDA MI OYNUYCAKSIN?"),
                                    actions: <Widget>[
                                      new TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text("TAMAM"),
                                      )
                                    ]);
                              },
                            );
                          } else if (sayilar[4] >= 1 ||
                              sayilar[8] >= 10 ||
                              sayilar[13] >= 1) {
                            showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                    title: new Text("SKİLLERİ Mİ UNUTTUN?"),
                                    content: new Text(
                                        "Verilmemiş skillerin var. Oyun seni zorluycağı için oyuna geçmiyorum"),
                                    actions: <Widget>[
                                      new TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text("TAMAM"),
                                      )
                                    ]);
                              },
                            );
                          } else if (sayilar[4] == 0 &&
                              sayilar[8] <= 10 &&
                              sayilar[13] <= 3) {
                            setState(() {
                              container = 1;
                              yeteneksayi = sayilar[9] +
                                  sayilar[10] +
                                  sayilar[11] +
                                  sayilar[12];
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => soru()),
                            );
                          }
                        });
                      },
                      child: Image.asset(
                        "assets/images/playbutton.gif",
                        fit: BoxFit.cover,
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Expanded kutular(
    String buton,
    String puan,
    String ozellik,
    Color renk,
  ) {
    return Expanded(
        child: Container(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    if (sayilar[4] != 0) {
                      switch (ozellik) {
                        case 'minyon':
                          sayilar[0] = sayilar[0] + 2; //minyon
                          sayilar[4] = sayilar[4] - 2;
                          if (sayilar[0] == 0) {
                            minyon = Colors.white;
                          } else if (sayilar[0] == 2) {
                            minyon = Colors.green;
                          } else if (sayilar[0] == 4) {
                            minyon = Colors.blue;
                          } else if (sayilar[0] == 6) {
                            minyon = Colors.purple;
                          } else if (sayilar[0] == 8) {
                            minyon = Colors.orange;
                          }
                          if (sayilar[0] == 10) {
                            setState(() {
                              sayilar[0] = sayilar[0] - 2; //minyon
                              sayilar[4] = sayilar[4] + 2;
                              enfazla(
                                  "En fazla", "En Fazla 8 tane verebilirsin");
                            });
                          }
                          break;
                        case 'safe':
                          sayilar[1]++;
                          sayilar[4]--;
                          if (sayilar[1] == 0) {
                            safe = Colors.white;
                          } else if (sayilar[1] == 2) {
                            safe = Colors.green;
                          } else if (sayilar[1] == 4) {
                            safe = Colors.blue;
                          } else if (sayilar[1] == 6) {
                            safe = Colors.purple;
                          } else if (sayilar[1] == 8) {
                            safe = Colors.orange;
                          }
                          if (sayilar[1] == 9) {
                            setState(() {
                              sayilar[1] = sayilar[1] - 1; //minyon
                              sayilar[4] = sayilar[4] + 1;
                              enfazla(
                                  "En fazla", "En Fazla 8 tane verebilirsin");
                            });
                          }
                          break;
                        case 'kill':
                          sayilar[2]++;
                          sayilar[4]--;
                          if (sayilar[2] == 0) {
                            kill = Colors.white;
                          } else if (sayilar[2] == 2) {
                            kill = Colors.green;
                          } else if (sayilar[2] == 4) {
                            kill = Colors.blue;
                          } else if (sayilar[2] == 6) {
                            kill = Colors.purple;
                          } else if (sayilar[2] == 8) {
                            kill = Colors.orange;
                          }
                          if (sayilar[2] == 9) {
                            setState(() {
                              sayilar[2] = sayilar[2] - 1; //minyon
                              sayilar[4] = sayilar[4] + 1;
                              enfazla(
                                  "En fazla", "En Fazla 8 tane verebilirsin");
                            });
                          }
                          break;
                        case 'assist':
                          sayilar[14]++;
                          sayilar[4]--;
                          if (sayilar[2] == 0) {
                            assist = Colors.white;
                          } else if (sayilar[2] == 2) {
                            assist = Colors.green;
                          } else if (sayilar[2] == 4) {
                            assist = Colors.blue;
                          } else if (sayilar[2] == 6) {
                            assist = Colors.purple;
                          } else if (sayilar[2] == 8) {
                            assist = Colors.orange;
                          }
                          if (sayilar[14] == 9) {
                            sayilar[14] = sayilar[14] - 1; //minyon
                            sayilar[4] = sayilar[4] + 1;
                            enfazla("En fazla", "En Fazla 8 tane verebilirsin");
                          }

                          break;
                      }
                    }

                    if (sayilar[8] != 0) {
                      switch (ozellik) {
                        case 'sans':
                          sayilar[5] = sayilar[5] + 1;
                          sayilar[8] = sayilar[8] - 10;
                          if (sayilar[5] == 0) {
                            sans = Colors.white;
                          } else if (sayilar[5] == 2) {
                            sans = Colors.green;
                          } else if (sayilar[5] == 4) {
                            sans = Colors.blue;
                          } else if (sayilar[5] == 6) {
                            sans = Colors.purple;
                          } else if (sayilar[5] == 8) {
                            sans = Colors.orange;
                          }
                          if (sayilar[8] < 0) {
                            sayilar[5] = sayilar[5] - 1; //minyon
                            sayilar[8] = sayilar[8] + 10;
                            enfazla("En fazla", "Daha fazla veremessin");
                          }
                          break;
                        case 'tecrübe':
                          sayilar[6] = sayilar[6] + 1;
                          sayilar[8] = sayilar[8] - 10;
                          if (sayilar[6] == 0) {
                            tecrube = Colors.white;
                          } else if (sayilar[6] == 2) {
                            tecrube = Colors.green;
                          } else if (sayilar[6] == 4) {
                            tecrube = Colors.blue;
                          } else if (sayilar[6] == 6) {
                            tecrube = Colors.purple;
                          } else if (sayilar[6] == 8) {
                            tecrube = Colors.orange;
                          }
                          if (sayilar[8] < 0) {
                            sayilar[6] = sayilar[6] - 1; //minyon
                            sayilar[8] = sayilar[8] + 10;
                            enfazla("En fazla", "Daha fazla veremessin");
                          }
                          break;
                        case 'karakterler':
                          sayilar[7] = sayilar[7] + 1;
                          sayilar[8] = sayilar[8] - 10;
                          if (sayilar[7] == 0) {
                            karakterler = Colors.white;
                          } else if (sayilar[7] == 2) {
                            karakterler = Colors.green;
                          } else if (sayilar[7] == 4) {
                            karakterler = Colors.blue;
                          } else if (sayilar[7] == 6) {
                            karakterler = Colors.purple;
                          } else if (sayilar[7] == 8) {
                            karakterler = Colors.orange;
                          }
                          if (sayilar[8] < 0) {
                            sayilar[7] = sayilar[7] - 1; //minyon
                            sayilar[8] = sayilar[8] + 10;

                            enfazla("En fazla", "Daha fazla veremessin");
                          }
                          break;
                        case 'kule':
                          sayilar[3] = sayilar[3] + 1;
                          sayilar[8] = sayilar[8] - 10;
                          if (sayilar[3] == 0) {
                            kule = Colors.white;
                          } else if (sayilar[3] == 2) {
                            kule = Colors.green;
                          } else if (sayilar[3] == 4) {
                            kule = Colors.blue;
                          } else if (sayilar[3] == 6) {
                            kule = Colors.purple;
                          } else if (sayilar[3] == 8) {
                            kule = Colors.orange;
                          }
                          if (sayilar[8] < 0) {
                            sayilar[3] = sayilar[3] - 1; //minyon
                            sayilar[8] = sayilar[8] + 10;
                            enfazla("En fazla", "Daha fazla veremessin");
                          }
                          break;
                      }
                    }
                    if (sayilar[13] != 0) {
                      switch (ozellik) {
                        case 'minyoncarpan':
                          sayilar[9] = sayilar[13] / 3;
                          sayilar[13] = 0;
                          if (sayilar[9] == 0) {
                            minyoncarpan = Colors.white;
                          } else if (sayilar[9] >= 8) {
                            minyoncarpan = Colors.green;
                          } else if (sayilar[9] >= 12) {
                            minyoncarpan = Colors.blue;
                          } else if (sayilar[9] >= 15) {
                            minyoncarpan = Colors.purple;
                          } else if (sayilar[9] >= 20) {
                            minyoncarpan = Colors.orange;
                          }
                          if (sayilar[13] < 0) {
                            sayilar[9] = 0;
                            sayilar[13] = sayilar[9] * 3;
                            enfazla(
                                "Sadece", "Sadece 1 yeteneğe verebilirsiniz");
                          }
                          break;

                        case 'killcarpan':
                          sayilar[10] = sayilar[13] / 3;
                          sayilar[13] = 0;
                          if (sayilar[10] == 0) {
                            killcarpan = Colors.white;
                          } else if (sayilar[10] >= 8) {
                            killcarpan = Colors.green;
                          } else if (sayilar[10] >= 12) {
                            killcarpan = Colors.blue;
                          } else if (sayilar[10] >= 15) {
                            killcarpan = Colors.purple;
                          } else if (sayilar[10] >= 20) {
                            killcarpan = Colors.orange;
                          }
                          if (sayilar[13] < 0) {
                            sayilar[10] = 0;
                            sayilar[13] = sayilar[10] * 3;
                            enfazla(
                                "Sadece", "Sadece 1 yeteneğe verebilirsiniz");
                          }
                          break;
                        case 'assistcarpan':
                          sayilar[11] = sayilar[13] / 3;
                          sayilar[13] = 0;
                          if (sayilar[11] == 0) {
                            assistcarpan = Colors.white;
                          } else if (sayilar[11] >= 8) {
                            assistcarpan = Colors.green;
                          } else if (sayilar[11] >= 12) {
                            assistcarpan = Colors.blue;
                          } else if (sayilar[11] >= 15) {
                            assistcarpan = Colors.purple;
                          } else if (sayilar[11] >= 20) {
                            assistcarpan = Colors.orange;
                          }
                          if (sayilar[13] < 0) {
                            sayilar[11] = 0;
                            sayilar[13] = sayilar[11] * 3;
                            enfazla(
                                "Sadece", "Sadece 1 yeteneğe verebilirsiniz");
                          }
                          break;
                        case 'ölümcarpan':
                          sayilar[12] = sayilar[13] / 3;
                          sayilar[13] = 0;
                          if (sayilar[12] == 0) {
                            olumcarpan = Colors.white;
                          } else if (sayilar[12] >= 8) {
                            olumcarpan = Colors.green;
                          } else if (sayilar[12] >= 12) {
                            olumcarpan = Colors.blue;
                          } else if (sayilar[12] >= 15) {
                            olumcarpan = Colors.purple;
                          } else if (sayilar[12] >= 20) {
                            olumcarpan = Colors.orange;
                          }
                          if (sayilar[13] < 0) {
                            sayilar[12] = 0;
                            sayilar[13] = sayilar[12] * 3;
                            enfazla(
                                "Sadece", "Sadece 1 yeteneğe verebilirsiniz");
                          }
                          break;
                      }
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: renk,
                  radius: 25,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      '$buton',
                    ),
                    radius: 23,
                    child: Text(
                      puan,
                      style: TextStyle(fontSize: 20, color: renk),
                    ),
                  ),
                ))));
  }

  Future<dynamic> enfazla(String baslik, String cumle) {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
              title: new Text("$baslik"),
              content: new Text("$cumle"),
              actions: <Widget>[
                new TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("TAMAM"),
                )
              ]);
        });
  }

  Expanded butonlar(
    Padding yetenekler,
    Padding sayi,
  ) {
    return Expanded(
        child: Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: yetenekler,
        ),
      ),
      sayi,
    ]));
  }

  Expanded Tema(
    BorderRadius genislik,
    Column icerik,
  ) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(borderRadius: genislik),
              child: icerik,
            ),
          ),
        ],
      ),
    );
  }

  Expanded mevkiler() {
    return Expanded(
        child: Row(children: [
      Expanded(
          child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(children: [
                    deneme("SOLO", "assets/images/ölüm.png", solorenk),
                    deneme("MİD", "assets/images/ölüm.png", midrenk),
                    deneme("JUNG", "assets/images/ölüm.png", junglerenk),
                    deneme("ADC", "assets/images/ölüm.png", adcrenk),
                    deneme("SUP", "assets/images/ölüm.png", supportrenk),
                  ]),
                ))
              ]),
            ),
          ],
        ),
      )),
    ]));
  }

  Expanded deneme(
    String yazi,
    String resim,
    Color renk,
  ) {
    return Expanded(
        child: Container(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    if (yazi == "SOLO") {
                      midrenk = Colors.red;
                      junglerenk = Colors.red;
                      adcrenk = Colors.red;
                      supportrenk = Colors.red;
                      solorenk = Colors.green;
                      mevki = "SOLO";
                    } else if (yazi == "MİD") {
                      midrenk = Colors.green;
                      junglerenk = Colors.red;
                      adcrenk = Colors.red;
                      supportrenk = Colors.red;
                      solorenk = Colors.red;
                      mevki = "MİD";
                    } else if (yazi == "JUNG") {
                      midrenk = Colors.red;
                      junglerenk = Colors.green;
                      adcrenk = Colors.red;
                      supportrenk = Colors.red;
                      solorenk = Colors.red;
                      mevki = "JUNG";
                    } else if (yazi == "ADC") {
                      midrenk = Colors.red;
                      junglerenk = Colors.red;
                      adcrenk = Colors.green;
                      supportrenk = Colors.red;
                      solorenk = Colors.red;
                      mevki = "ADC";
                    } else if (yazi == "SUP") {
                      midrenk = Colors.red;
                      junglerenk = Colors.red;
                      adcrenk = Colors.red;
                      supportrenk = Colors.green;
                      solorenk = Colors.red;
                      mevki = "SUP";
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: renk,
                  radius: 25,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      resim,
                    ),
                    radius: 23,
                    child: Text(
                      yazi,
                      style: TextStyle(fontSize: 16, color: renk),
                    ),
                  ),
                ))));
  }
}
