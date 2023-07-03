import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lolproje/Bandle.dart';
import 'package:lolproje/Bilgewater.dart';
import 'package:lolproje/Hikaye.dart';

import 'Bandle.dart';
import 'Bilgewater.dart';
import 'data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await veri().createSharedPrefObject();
  runApp(
    Loluyg(),
  );
}

class Loluyg extends StatefulWidget {
  @override
  _LoluygState createState() => _LoluygState();
}

Hikayeveri Hikaye = Hikayeveri();
//veri data = veri();

class _LoluygState extends State<Loluyg> with SingleTickerProviderStateMixin {
  AnimationController IconController;
  bool isAnimation = false;
  bool showPlay = true;
  bool shopPause = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    IconController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    player.open(
      Playlist(audios: [
        Audio("assets/audio/lol.mp3"),
        Audio("assets/audio/lol1.mp3"),
      ]),
      loopMode: LoopMode.playlist,
      autoStart: false,
    );
  }

  @override
  Widget build(BuildContext) {
    veri().yuklenenler();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // üst kare
          centerTitle: true, //gözüksün
          backgroundColor: Colors.grey, //gri ols// un
          actions: [
            //appbarda sadece action acılabilir
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        CupertinoIcons.backward_fill,
                      ),
                      onTap: () {
                        if (isAnimation) {
                          player.previous();
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AnimateIcon();
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: IconController,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Icon(
                        CupertinoIcons.forward_fill,
                      ),
                      onTap: () {
                        if (isAnimation) {
                          player.next();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              //lol yazısı

              child: Container(
                child: Text(
                  'League Of Legends RPG',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              //çıkış butonu
              child: Container(
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.red),
                  onPressed: () {},
                  child: const Text(
                    'ÇIKIŞ',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SolTaraf(),
      ),
    );
  }

  void AnimateIcon() {
    setState(() {
      isAnimation = !isAnimation;

      if (isAnimation) {
        IconController.forward();
        player.play();
      } else {
        IconController.reverse();
        player.pause();
      }
    });
  }
}

class SolTaraf extends StatefulWidget {
  @override
  State<SolTaraf> createState() => _SolTarafState();
}

class _SolTarafState extends State<SolTaraf> {
  String bolgeler1 =
      'Yordleların yurdu olan bu şehrin tam olarak nerede olduğuna dair herkesin farklı bir görüşü var; fakat pek çok ölümlü ufak, haylaz canlıların yaşadığı, ilginç ve efsunlu diyarlara giden, gözle görülmeyen yollardan bahsediyor. Bu yere kontrolsüz bir büyünün hâkim olduğunu, dikkat etmeyenlerin sayısız harikaların peşinde sürüklenip bir rüyada kaybolabileceğini söylüyorlar.Bandle Şehrinde hissedilen her şeyin, yordle olmayanlar için çok daha yoğun olduğu söyleniyor. Renkler daha parlak geliyor. Yiyecek ve içeceklerin tadı duyulardan taşıyor ve bir kez tüketilen şeyin tadı ömür boyunca unutulmuyor. Güneş sürekli altın rengi parlıyor, ırmakların suyu cam gibi berrak akıyor ve hasatlar hep bereketli oluyor. Bu rivayetlerin bazıları gerçektir belki. Belki de hiçbiri değildir. Kesin bir şey söylemek imkânsız, çünkü ziyaretçilerin anlattığı hiçbir şey birbirini tutmuyor.Kesin olan tek şey, Bandle Şehrinin ve şehir sakinlerinin zamana meydan okuması. Oraya giden fanilerden bazılarının çok daha yaşlanmış şekilde dönmesinin; çoğununsa hiç dönememesinin nedeni bu olabilir.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 3),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //

                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          //sol taraf

                          color: Colors.grey,

                          child: Column(
                            //text satırı
                            children: [
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Bandle',
                                  0,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Bilgewater',
                                  1,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Demacia',
                                  2,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Flerjord',
                                  3,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'GölgeAdalar',
                                  4,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Hiçlik',
                                  5,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Ionia',
                                  6,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Ixtal',
                                  7,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.red,
                                  'Lobster',
                                  'Noxus',
                                  8,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Piltover',
                                  9,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.yellowAccent,
                                  'Lobster',
                                  'Shurima',
                                  10,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Targon',
                                  11,
                                ),
                              ),
                              Expanded(
                                child: buildsoltaraf(
                                  Colors.black,
                                  Colors.green,
                                  'Lobster',
                                  'Zaun',
                                  12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(width: 3),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            ListTile(
                              tileColor: Colors.black,
                              title: Text(
                                "$bolgeler1",
                                style: TextStyle(
                                  //fontFamily: 'Lobster',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 200,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: TextButton(
                                style:
                                    TextButton.styleFrom(primary: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    if (Hikaye.secim == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => bandle()),
                                      );
                                    }
                                    if (Hikaye.secim == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => bilgewater()),
                                      );
                                    }
                                  });
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildsoltaraf(
    Color renk,
    Color arkaplan,
    String stil,
    String isim,
    int bolge,
  ) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: arkaplan,
        ),
        onPressed: () {
          setState(() {
            Hikaye.secim = bolge;
            bolgeler1 = Hikaye.getHikaye();
          });
        },
        child: Text(
          isim,
          style: TextStyle(
            fontFamily: stil,
            color: renk,
          ),
        ),
      ),
    );
  }
}
