import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lolproje/data.dart';
import 'package:lolproje/junglesoru.dart';
import 'package:lolproje/sonuc.dart';

import 'Adcsoru.dart';
import 'Detaylar.dart';
import 'Midsoru.dart';
import 'Solosoru.dart';
import 'Supsoru.dart';
import 'Yetenekler.dart';
import 'baslangıcsoru.dart';
import 'junglesoru.dart';

class soru extends StatefulWidget {
  @override
  _sorusayfasi createState() => _sorusayfasi();
}

int saniye = 0;
int dakika = 0;
int container = 1;
int zamangecici = 0;
int zaman = Random().nextInt(5) + 2;
num max = Random().nextInt(baslangicsorular.length) + 0;
double randomsans = Random().nextInt(100) + 1.toDouble();
String degisken = "";
String mevkidegisken = "";
List<int> mevkisayi = [
  0, //random baslangıc 0
  0, //random son 1
  0, //minyon win etkisi 2
  0, // yetenekten gelen minyon kısıtlama 3
  0, //ara eleman(kill) 4
  0, // kill random sayısı 5
  0, // kill yetenek random 6
  0, //ara eleman(assist) 7
  0, // assist random sayısı 8
  0, // assit yetenek random 9
  0, //ara eleman(ölüm)10
  0, //ölüm random sayısı 11
  0, //ölüm yetenek random 12
  0, //ara eleman (kule) 13
  0, // kule random sayısı 14
  0, // kule yetenek random 15
];
var sonucdegisken1 = []..length = baslangiccevap1.length;
var sonucdegisken2 = []..length = baslangiccevap1.length;
var sonucdegisken3 = []..length = baslangiccevap1.length;
var sonucdegisken4 = []..length = baslangiccevap1.length;
String cevapsonucu = "";
List<String> degiskensonuc = [
  "",
];

List<String> baslangiccevap = ["", "", "", "", ""];
num sonucsayi1 = 0;
num sonucsayi2 = 0;
num toplampuanfonk = (0.toDouble() / 200);
String cevapalinan = "";
List<dynamic> cevapfonk = [
  0, //minyon 0
  "minyon Aldın",
  0, //olum 2
  "",
  0, //kule 4
  "kule Aldın",
  0, //assist 6
  "assist Aldın",
  0, //kill 8
  "kill Aldın",
  0, //win 10
  "win Aldın",
  0, //lose 12
  "lose Aldın",
  0, //güvenli 14
  "güvenli şansı Aldın",
  0, //solo 16
  "Solo şansı Aldın ",
  0, // takım 18
  "Takım şansı Aldın",
  0, //sans 20
  "Şans şansı Aldın", //21
  "minyon Kaybettin", //22
  "",
  "Kere Öldün", //23
  "",
  "kule Kaybettin", //24
  "",
  "assist Kaybettin", //25
  "",
  "", //26
  "",
  "", //27
  "",
  "", //28
  "",
  "güvenli şansı Kaybettin", //29
  "",
  "Solo şansı Kaybettin ", //30
  "",
  "Takım şansı Kaybettin", //31
  "",
  "Şans şansı Kaybettin", //32
];
List<dynamic> bordalinan = [
  0, //minyon 0
  "minyon",
  0, //olum  2
  "ölüm",
  0, //kule 4
  "kule",
  0, //assist 6
  "assist",
  0, //kill  8
  "kill",
  50, //win   10
  "win",
  50, //lose  12
  "lose",
  sayilar[5].toInt(), //güvenli 14
  "güvenli şansı",
  sayilar[6].toInt(), //solo 16
  "Solo şansı",
  sayilar[7].toInt(), // takım 18
  "Takım şansı",
  sayilar[3].toInt(), // sans 20
  "Şans şansı"
];
List<dynamic> sonucgosterge = [
  0, //minyon 0
  "Sorulardan gelen minyon:",
  0, //olum  2
  "Sorulardan gelen ölüm:",
  0, //kule 4
  "Sorulardan gelen kule:",
  0, //assist 6
  "Sorulardan gelen assist:",
  0, //kill  8
  "Sorulardan gelen kill:",
  0, //win   10
  "Sorulardan gelen win:",
  0, //lose  12
  "Sorulardan gelen lose:",
  0, //güvenli 14
  "Sorulardan gelen güvenli şansı:",
  0, //solo 16
  "Sorulardan gelen Solo şansı:",
  0, // takım 18
  "Sorulardan gelen Takım şansı:",
  0, // sans 20
  "Sorulardan gelen Şans şansı:",
  0, // Toplam minyon 22
  "Toplam Alınan Minyon:",
  0, // Toplam kill 24
  "Toplam Alınan Kill:",
  0, // Toplam Kule 26
  "Toplam Alınan Kule:",
  0, //Toplam Assist 28
  "Toplam Alınan assist:",
  0, //Toplam ölümler 30
  "Toplam ölümler:"
];
num skillsans = 0;
int skillcarpan = 0;
double toplamfonkdegisken = 0.0;
int sanssansi = 0;
int sonucgec = Random().nextInt(25) + 25;
int saniyerandom = Random().nextInt(59) + 0;
num Derecepuan = 0;

class _sorusayfasi extends State<soru> {
  Duration duration = Duration();
  Timer timer;
  bool isCountdown = true;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        saniye++;
      });
    });
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
    });
  }

  int araelaman = 1;
  int minyonwin = 0;
  int s = 0;
  double minyoncarpan = 0;

  Widget build(BuildContext context) {
    if (saniye >= 60) {
      dakika++;
      saniye = 0;
    }
    if (dakika == 0 && saniye == 0) {
      if (mevki == "ADC") {
        mevkisayi[0] = 1;
        mevkisayi[1] = 3;
        mevkisayi[2] = 20;
        mevkisayi[3] = 2;
        mevkisayi[5] = 50;
        mevkisayi[6] = 1;
        mevkisayi[8] = 60;
        mevkisayi[9] = 1;
        mevkisayi[11] = 2;
        mevkisayi[12] = 60;
        mevkisayi[14] = 2;
        mevkisayi[15] = 40;
      }
      if (mevki == "SOLO") {
        mevkisayi[0] = 1;
        mevkisayi[1] = 3;
        mevkisayi[2] = 20;
        mevkisayi[3] = 2;
        mevkisayi[5] = 50;
        mevkisayi[6] = 1;
        mevkisayi[8] = 60;
        mevkisayi[9] = 1;
        mevkisayi[11] = 1;
        mevkisayi[12] = 50;
        mevkisayi[14] = 2;
        mevkisayi[15] = 40;
      }
      if (mevki == "JUNG") {
        mevkisayi[0] = 1;
        mevkisayi[1] = 3;
        mevkisayi[2] = 30;
        mevkisayi[3] = 2;
        mevkisayi[5] = 50;
        mevkisayi[6] = 1;
        mevkisayi[9] = 2;
        mevkisayi[8] = 40;
        mevkisayi[11] = 1;
        mevkisayi[12] = 50;
        mevkisayi[14] = 1;
        mevkisayi[15] = 60;
      }
      if (mevki == "MİD") {
        mevkisayi[0] = 1;
        mevkisayi[1] = 3;
        mevkisayi[2] = 30;
        mevkisayi[3] = 2;
        mevkisayi[5] = 50;
        mevkisayi[6] = 1;
        mevkisayi[8] = 60;
        mevkisayi[9] = 1;
        mevkisayi[11] = 1;
        mevkisayi[12] = 50;
        mevkisayi[14] = 1;
        mevkisayi[15] = 50;
      }
      if (mevki == "SUP") {
        mevkisayi[0] = 0;
        mevkisayi[1] = 2;
        mevkisayi[2] = 20;
        mevkisayi[3] = 4;
        mevkisayi[5] = 80;
        mevkisayi[6] = 2;
        mevkisayi[8] = 40;
        mevkisayi[9] = 2;
        mevkisayi[11] = 2;
        mevkisayi[12] = 30;
        mevkisayi[14] = 1;
        mevkisayi[15] = 70;
      }
      startTimer();
    }
    if (dakika >= 1 && saniye >= 05) if (saniye == 30 || saniye == 59) {
      minyoncarpan = (sayilar[0] / mevkisayi[3]);
      araelaman = (Random().nextInt(mevkisayi[1] + minyoncarpan.toInt()) +
          mevkisayi[0]);
      minyonwin = minyonwin + araelaman;
      bordalinan[0] = bordalinan[0].toInt() + araelaman.toInt();
    }

    if (minyonwin >= mevkisayi[2]) {
      for (num i = 19; i < minyonwin; minyonwin = minyonwin - mevkisayi[2]) {
        bordalinan[10] = bordalinan[10] + 1;
        bordalinan[12] = bordalinan[12] - 1;
      }
    }
    if (minyonwin < 0) {
      for (num i = 0; i >= minyonwin; minyonwin = minyonwin + mevkisayi[2]) {
        bordalinan[10] = bordalinan[10] - 1;
        bordalinan[12] = bordalinan[12] + 1;
      }
    }
    if (dakika > 3) {
      if (saniye == 35) {
        num saferandom = 0;
        num killrandom = 0;
        num assistrandom = 0;
        saferandom = Random().nextInt(100) + 0;
        killrandom = Random().nextInt(100) + 0;
        assistrandom = Random().nextInt(100) + 0;
        killrandom = (killrandom + sayilar[2] / mevkisayi[6]) - toplampuanfonk;
        saferandom = (saferandom - sayilar[1] * mevkisayi[11]) + toplampuanfonk;
        if (mevki == "SUP") {
          saferandom =
              (saferandom - sayilar[1] / mevkisayi[11]) + toplampuanfonk;
        }

        assistrandom =
            (assistrandom + sayilar[14] * mevkisayi[9]) - toplampuanfonk;
        if (assistrandom >= mevkisayi[8]) {
          bordalinan[6] = bordalinan[6] + 1;
          mevkisayi[7] = mevkisayi[7] + 1;
        }
        if (killrandom >= mevkisayi[5]) {
          bordalinan[8] = bordalinan[8] + 1;
          mevkisayi[4] = mevkisayi[4] + 1;
        }
        if (saferandom >= mevkisayi[12]) {
          bordalinan[2] = bordalinan[2] + 1;
          mevkisayi[10] = mevkisayi[10] + 1;
        }
      }
    }

    if (mevki == "JUNG" && mevkisayi[7] >= 1 || //assist ayar
        mevki == "SUP" && mevkisayi[7] >= 1) {
      for (num i = 0; i < mevkisayi[7]; mevkisayi[7] = mevkisayi[7] - 1) {
        bordalinan[10] = bordalinan[10] + 1;
        bordalinan[12] = bordalinan[12] - 1;
      }
    }

    if (mevki == "ADC" && mevkisayi[7] >= 2 ||
        mevki == "MİD" && mevkisayi[7] >= 2 ||
        mevki == "SOLO" && mevkisayi[7] >= 2) {
      for (num i = 0; i < mevkisayi[7]; mevkisayi[7] = mevkisayi[7] - 2) {
        bordalinan[10] = bordalinan[10] + 1;
        bordalinan[12] = bordalinan[12] - 1;
      }
    }
    if (mevki == "JUNG" && mevkisayi[7] < 0 || //assist - ayar
        mevki == "SUP" && mevkisayi[7] < 0) {
      for (num i = 0; i >= mevkisayi[7]; mevkisayi[7] = mevkisayi[7] + 1) {
        bordalinan[10] = bordalinan[10] - 1;
        bordalinan[12] = bordalinan[12] + 1;
      }
    }

    if (mevki == "ADC" && mevkisayi[7] < 0 ||
        mevki == "MİD" && mevkisayi[7] < 0 ||
        mevki == "SOLO" && mevkisayi[7] < 0) {
      for (num i = 0; i >= mevkisayi[7]; mevkisayi[7] = mevkisayi[7] + 2) {
        bordalinan[10] = bordalinan[10] - 1;
        bordalinan[12] = bordalinan[12] + 1;
      }
    }

    if (mevki == "SOLO" && mevkisayi[4] >= 2 || //kill ayar
        mevki == "JUNGLE" && mevkisayi[4] >= 2) {
      for (num i = 0; i < mevkisayi[4]; mevkisayi[4] = mevkisayi[4] - 2) {
        bordalinan[10] = bordalinan[10] + 1;
        bordalinan[12] = bordalinan[12] - 1;
      }
    }
    if (mevki == "MİD" && mevkisayi[4] >= 1 ||
        mevki == "ADC" && mevkisayi[4] >= 1 ||
        mevki == "SUP" && mevkisayi[4] >= 1) {
      for (num i = 0; i < mevkisayi[4]; mevkisayi[4] = mevkisayi[4] - 1) {
        bordalinan[10] = bordalinan[10] + 1;
        bordalinan[12] = bordalinan[12] - 1;
      }
    }

    if (mevki == "SOLO" && mevkisayi[10] >= 1 || //ölüm ayar
        mevki == "JUNG" && mevkisayi[10] >= 1 ||
        mevki == "Mid" && mevkisayi[10] >= 1) {
      for (num i = 0; i < mevkisayi[10]; mevkisayi[10] = mevkisayi[10] - 1) {
        bordalinan[10] = bordalinan[10] - 2;
        bordalinan[12] = bordalinan[12] + 2;
      }
    }
    if (mevki == "ADC" && mevkisayi[10] >= 1) {
      for (num i = 0; i < mevkisayi[10]; mevkisayi[10] = mevkisayi[10] - 1) {
        bordalinan[10] = bordalinan[10] - 3;
        bordalinan[12] = bordalinan[12] + 3;
      }
    }
    if (mevki == "SUP" && mevkisayi[10] >= 3) {
      for (num i = 0; i < mevkisayi[10]; mevkisayi[10] = mevkisayi[10] - 3) {
        bordalinan[10] = bordalinan[10] - 1;
        bordalinan[12] = bordalinan[12] + 1;
      }
    }

    if (dakika > 15) {
      if (saniye == 40) {
        num kulerandom = 0;
        kulerandom = Random().nextInt(100) + 0;
        kulerandom = (kulerandom + sayilar[3] * mevkisayi[14]) - toplampuanfonk;
        if (kulerandom >= mevkisayi[15] && bordalinan[4] < 11) {
          bordalinan[4] = bordalinan[4] + 1;
          mevkisayi[13] = mevkisayi[13] + 1;
        }
        if (mevki == "ADC" && mevkisayi[13] >= 1) {
          //kule ayar
          for (num i = 0;
              i < mevkisayi[13];
              mevkisayi[13] = mevkisayi[13] - 1) {
            bordalinan[10] = bordalinan[10] + 2;
            bordalinan[12] = bordalinan[12] - 2;
          }
        }
        if (mevki == "MİD" && mevkisayi[13] >= 1 ||
            mevki == "JUNG" && mevkisayi[13] >= 1 ||
            mevki == "SOLO" && mevkisayi[13] >= 1 ||
            mevki == "SUP" && mevkisayi[13] >= 1) {
          for (num i = 0;
              i < mevkisayi[13];
              mevkisayi[13] = mevkisayi[13] - 1) {
            bordalinan[10] = bordalinan[10] + 1;
            bordalinan[12] = bordalinan[12] - 1;
          }
        }
        if (mevki == "ADC" && mevkisayi[13] < 0) {
          //kule - ayar
          for (num i = 0;
              i >= mevkisayi[13];
              mevkisayi[13] = mevkisayi[13] + 1) {
            bordalinan[10] = bordalinan[10] - 2;
            bordalinan[12] = bordalinan[12] + 2;
          }
        }
        if (mevki == "MİD" && mevkisayi[13] < 0 ||
            mevki == "JUNG" && mevkisayi[13] < 0 ||
            mevki == "SOLO" && mevkisayi[13] < 0 ||
            mevki == "SUP" && mevkisayi[13] < 0) {
          for (num i = 0;
              i >= mevkisayi[13];
              mevkisayi[13] = mevkisayi[13] + 1) {
            bordalinan[10] = bordalinan[10] - 1;
            bordalinan[12] = bordalinan[12] + 1;
          }
        }
      }
    }

    if (dakika == 0 && saniye == 30) {
      var cevapdegisken = new List<int>.generate(4, (int index) => index);
      cevapdegisken.shuffle();
      container = 0;
      stopTimer();
      degisken = "${baslangicsorular[max]}";
      baslangiccevap[cevapdegisken[0]] = "${baslangiccevap1[max]}";
      baslangiccevap[cevapdegisken[1]] = "${baslangiccevap2[max]}";
      baslangiccevap[cevapdegisken[2]] = "${baslangiccevap3[max]}";
      baslangiccevap[cevapdegisken[3]] = "${baslangiccevap4[max]}";
      for (int i = 0; i < baslangiccevap1.length; i++) {
        sonucdegisken1[i] = baslangiccevap1[i];
        sonucdegisken2[i] = baslangiccevap2[i];
        sonucdegisken3[i] = baslangiccevap3[i];
        sonucdegisken4[i] = baslangiccevap4[i];
      }
      degiskensonuc = sorusonuc;
    }
    if (zaman == dakika && saniyerandom == saniye) {
      zamangecici = zamangecici + 7;
      zaman = Random().nextInt(7) + zamangecici;
      var cevapdegisken = new List<int>.generate(4, (int index) => index);
      cevapdegisken.shuffle();
      switch (mevkidegisken) {
        case "JUNG":
          max = Random().nextInt(baslangicsorularjungle.length) + 0;
          degisken = "${baslangicsorularjungle[max]}";
          baslangiccevap[cevapdegisken[0]] = "${junglecevap1[max]}";
          baslangiccevap[cevapdegisken[1]] = "${junglecevap2[max]}";
          baslangiccevap[cevapdegisken[2]] = "${junglecevap3[max]}";
          baslangiccevap[cevapdegisken[3]] = "${junglecevap4[max]}";
          for (int i = 0; i < baslangiccevap1.length; i++) {
            sonucdegisken1[i] = junglecevap1[i];
            sonucdegisken2[i] = junglecevap2[i];
            sonucdegisken3[i] = junglecevap3[i];
            sonucdegisken4[i] = junglecevap4[i];
          }
          degiskensonuc = junglesonuc;
          break;
        case "SOLO":
          max = Random().nextInt(baslangicsorularsolo.length) + 0;
          degisken = "${baslangicsorularsolo[max]}";
          baslangiccevap[cevapdegisken[0]] = "${solocevap1[max]}";
          baslangiccevap[cevapdegisken[1]] = "${solocevap2[max]}";
          baslangiccevap[cevapdegisken[2]] = "${solocevap3[max]}";
          baslangiccevap[cevapdegisken[3]] = "${solocevap4[max]}";
          for (int i = 0; i < baslangiccevap1.length; i++) {
            sonucdegisken1[i] = solocevap1[i];
            sonucdegisken2[i] = solocevap2[i];
            sonucdegisken3[i] = solocevap3[i];
            sonucdegisken4[i] = solocevap4[i];
          }
          degiskensonuc = solosonuc;
          break;
        case "MİD":
          max = Random().nextInt(baslangicsorularmid.length) + 0;
          degisken = "${baslangicsorularmid[max]}";
          baslangiccevap[cevapdegisken[0]] = "${midcevap1[max]}";
          baslangiccevap[cevapdegisken[1]] = "${midcevap2[max]}";
          baslangiccevap[cevapdegisken[2]] = "${midcevap3[max]}";
          baslangiccevap[cevapdegisken[3]] = "${midcevap4[max]}";
          for (int i = 0; i < baslangiccevap1.length; i++) {
            sonucdegisken1[i] = midcevap1[i];
            sonucdegisken2[i] = midcevap2[i];
            sonucdegisken3[i] = midcevap3[i];
            sonucdegisken4[i] = midcevap4[i];
          }
          degiskensonuc = midsonuc;
          break;
        case "SUP":
          max = Random().nextInt(baslangicsorularsup.length) + 0;
          degisken = "${baslangicsorularsup[max]}";
          baslangiccevap[cevapdegisken[0]] = "${supcevap1[max]}";
          baslangiccevap[cevapdegisken[1]] = "${supcevap2[max]}";
          baslangiccevap[cevapdegisken[2]] = "${supcevap3[max]}";
          baslangiccevap[cevapdegisken[3]] = "${supcevap4[max]}";
          for (int i = 0; i < baslangiccevap1.length; i++) {
            sonucdegisken1[i] = supcevap1[i];
            sonucdegisken2[i] = supcevap2[i];
            sonucdegisken3[i] = supcevap3[i];
            sonucdegisken4[i] = supcevap4[i];
          }
          degiskensonuc = supsonuc;
          break;
        case "ADC":
          max = Random().nextInt(baslangicsorularadc.length) + 0;
          degisken = "${baslangicsorularadc[max]}";
          baslangiccevap[cevapdegisken[0]] = "${adccevap1[max]}";
          baslangiccevap[cevapdegisken[1]] = "${adccevap2[max]}";
          baslangiccevap[cevapdegisken[2]] = "${adccevap3[max]}";
          baslangiccevap[cevapdegisken[3]] = "${adccevap4[max]}";
          for (int i = 0; i < baslangiccevap1.length; i++) {
            sonucdegisken1[i] = adccevap1[i];
            sonucdegisken2[i] = adccevap2[i];
            sonucdegisken3[i] = adccevap3[i];
            sonucdegisken4[i] = adccevap4[i];
          }
          degiskensonuc = adcsonuc;
          break;
      }

      if (saniyerandom == saniye) {
        saniyerandom = Random().nextInt(59) + 0;
        container = 0;
        stopTimer();
      }
    }
    if (sonucgec == dakika && saniyerandom == saniye) {
      sonucgosterge[22] = bordalinan[0];
      sonucgosterge[24] = bordalinan[8];
      sonucgosterge[26] = bordalinan[4];
      sonucgosterge[28] = bordalinan[6];
      sonucgosterge[30] = bordalinan[2];
      Derecepuan = bordalinan[10] - bordalinan[12];
      puan = puan + Derecepuan;
      veri().kaydedilenler();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print(sonucgec);
        print(saniyerandom);
        stopTimer();
        sonucgec = sonucgec + 1;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => sonuc()),
        );
      });
    }

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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/arkaplan2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Expanded(
                    child: container == 0 ? SoruContainer() : cevapContainer())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container SoruContainer() {
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flex(direction: Axis.vertical, children: [
            Row(children: [
              Container(
                width: 90,
                child: kda(
                    "assets/images/lolkarakter.jpg",
                    "${bordalinan[8]}/${bordalinan[2]}/${bordalinan[6]}",
                    Colors.black),
              ),
              Expanded(
                  child: kda("assets/images/lolkarakter.jpg",
                      "${bordalinan[4]}", Colors.black)),
              Expanded(
                  child: kda("assets/images/lolkarakter.jpg",
                      "${bordalinan[0]}", Colors.black)),
              Expanded(
                  child: Flex(direction: Axis.horizontal, children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage("assets/images/lolkarakter.jpg"),
                ),
                Text(
                  "${bordalinan[10]}",
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  "/",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "${bordalinan[12]}",
                  style: TextStyle(color: Colors.red),
                ),
              ])),
              Expanded(
                child: kda("assets/images/lolkarakter.jpg", "$dakika:$saniye",
                    Colors.black),
              ),
            ]),
            Container(
                child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 30,
              ),
              child: Text("${degisken}"),
            )),
          ]),
          Expanded(
              child: Flex(
            direction: Axis.vertical,
            children: [
              Row(children: [
                cevap1("${baslangiccevap[0]}", 0),
                cevap1("${baslangiccevap[1]}", 1),
              ]),
              Row(children: [
                cevap1("${baslangiccevap[2]}", 2),
                cevap1("${baslangiccevap[3]}", 3),
              ]),
            ],
          ))
        ],
      ),
    );
  }

  Flex kda(
    String icon,
    String yazi,
    Color yazirenk,
  ) {
    return Flex(direction: Axis.horizontal, children: [
      CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage(icon),
      ),
      Text(
        yazi,
        style: TextStyle(color: yazirenk),
      ),
    ]);
  }

  Container cevapContainer() {
    return Container(
      child: Flex(direction: Axis.vertical, children: [
        Flex(direction: Axis.vertical, children: [
          Row(children: [
            Container(
              width: 90,
              child: kda(
                  "assets/images/lolkarakter.jpg",
                  "${bordalinan[8]}/${bordalinan[2]}/${bordalinan[6]}",
                  Colors.black),
            ),
            Expanded(
                child: kda("assets/images/lolkarakter.jpg", "${bordalinan[4]}",
                    Colors.black)),
            Expanded(
                child: kda("assets/images/lolkarakter.jpg", "${bordalinan[0]}",
                    Colors.black)),
            Expanded(
                child: Flex(direction: Axis.horizontal, children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage("assets/images/lolkarakter.jpg"),
              ),
              Text(
                "${bordalinan[10]}",
                style: TextStyle(color: Colors.green),
              ),
              Text(
                "/",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${bordalinan[12]}",
                style: TextStyle(color: Colors.red),
              ),
            ])),
            Expanded(
              child: kda("assets/images/lolkarakter.jpg", "$dakika:$saniye",
                  Colors.black),
            ),
          ]),
          Container(
              child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 30,
            ),
            child: Text("${degisken}"),
          )),
        ]),
        Container(
            child: Padding(
          padding: EdgeInsets.only(
            top: 100,
          ),
          child: Text("$cevapsonucu $cevapalinan"),
        )),
      ]),
    );
  }

  Expanded cevap1(
    cevaplar,
    int deyisen,
  ) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: TextButton(
          onPressed: () {
            startTimer();
            container = 1;
            randomsans =
                Random().nextInt(101 + toplampuanfonk.toInt()) + 0.toDouble();
            skillsans = Random().nextInt(51) + 0.toDouble();
            mevkidegisken = mevki;
            sanssansi = Random().nextInt(6) + 0;
            if (sonucdegisken1.any(
                    (dogru) => dogru.contains('${baslangiccevap[deyisen]}')) ==
                true) {
              skillcarpan = 1;
              randomsans = randomsans + bordalinan[14];
              sonucsayi1 = 0;
              sonucsayi2 = 1;
            } else if (sonucdegisken2.any(
                    (dogru) => dogru.contains('${baslangiccevap[deyisen]}')) ==
                true) {
              skillcarpan = 3;
              sonucsayi1 = 2;
              sonucsayi2 = 3;
              randomsans = randomsans + bordalinan[16];
            } else if (sonucdegisken3.any(
                    (dogru) => dogru.contains('${baslangiccevap[deyisen]}')) ==
                true) {
              skillcarpan = 5;
              randomsans = randomsans + bordalinan[18];
              sonucsayi1 = 4;
              sonucsayi2 = 5;
            } else if (sonucdegisken4.any(
                    (dogru) => dogru.contains('${baslangiccevap[deyisen]}')) ==
                true) {
              randomsans = randomsans + bordalinan[20];
              skillcarpan = 6;
              sonucsayi1 = 6;
              sonucsayi2 = 7;
            }
            if (randomsans >= 50 + toplampuanfonk) {
              if (skillcarpan <= 5) {
                if (skillsans <= yeteneksayi + 4) {
                  if (sayilar[9] > 0) {
                    cevapfonk[8] = 1 * skillcarpan; //kill
                  } else if (sayilar[10] > 0) {
                    cevapfonk[6] = 2 * skillcarpan; //assist
                  } else if (sayilar[11] > 0) {
                    cevapfonk[4] = 1; //kule
                  } else if (sayilar[12] > 0) {
                    cevapfonk[0] = 10 * skillcarpan; //minyon
                  }
                } else if (randomsans >= 86 + toplampuanfonk) {
                  cevapfonk[0] = 10 * skillcarpan; //minyon
                } else if (randomsans >= 74 + toplampuanfonk) {
                  cevapfonk[8] = 1 * skillcarpan; //kill
                } else if (randomsans >= 62 + toplampuanfonk) {
                  cevapfonk[6] = 2 * skillcarpan; //assist
                } else if (randomsans >= 50 + toplampuanfonk) {
                  cevapfonk[4] = 1; //kule
                }
              }

              if (skillcarpan >= 6) {
                if (skillsans <= yeteneksayi + 4) {
                  if (sayilar[9] > 0) {
                    cevapfonk[0] = 10 * sanssansi; //minyon
                  } else if (sayilar[10] > 0) {
                    cevapfonk[4] = 2; //kule
                  } else if (sayilar[11] > 0) {
                    cevapfonk[8] = sanssansi; //kill
                  } else if (sayilar[12] > 0) {
                    cevapfonk[6] = sanssansi * 2; //assist
                  }
                } else if (randomsans <= 54.55 + toplamfonkdegisken) {
                  cevapfonk[8] = sanssansi; //kill
                } else if (randomsans <= 60.1 + toplamfonkdegisken) {
                  cevapfonk[4] = 2; //kule
                } else if (randomsans <= 65.65 + toplamfonkdegisken) {
                  cevapfonk[6] = sanssansi * 2; //assist
                } else if (randomsans <= 71.2 + toplamfonkdegisken) {
                  cevapfonk[0] = sanssansi * 10; //minyon
                } else if (randomsans <= 76.75 + toplamfonkdegisken) {
                  cevapfonk[12] = sanssansi;
                  bordalinan[10] = bordalinan[10] - sanssansi;
                  sonucgosterge[10] = sonucgosterge[10] + sanssansi;
                  //lose
                } else if (randomsans <= 82.30 + toplamfonkdegisken) {
                  cevapfonk[14] = sanssansi; //güvenli
                  sayilar[5] = sayilar[5] + sanssansi;
                  sonucgosterge[14] = sonucgosterge[14] + sanssansi;
                } else if (randomsans <= 87.85 + toplamfonkdegisken) {
                  cevapfonk[16] = sanssansi; //solo
                  sayilar[6] = sayilar[6] + sanssansi;
                  sonucgosterge[16] = sonucgosterge[16] + sanssansi;
                } else if (randomsans <= 93.39 + toplamfonkdegisken) {
                  cevapfonk[18] = sanssansi; //takım
                  sayilar[7] = sayilar[7] + sanssansi;
                  sonucgosterge[18] = sonucgosterge[18] + sanssansi;
                } else if (randomsans <= 99 + toplamfonkdegisken) {
                  cevapfonk[20] = sanssansi; // sans
                  sayilar[3] = sayilar[3] + sanssansi;
                  sonucgosterge[20] = sonucgosterge[20] + sanssansi;
                }
              }
              for (num i = 0; i <= 20; i = i + 2) {
                if (cevapfonk[i] > 0) {
                  bordalinan[i] = bordalinan[i] + cevapfonk[i];
                  sonucgosterge[i] = sonucgosterge[i] + cevapfonk[i];
                  cevapalinan = "${cevapfonk[i]} ${cevapfonk[i + 1]} ";
                  if (cevapfonk[i + 1] == "minyon Aldın") {
                    //minyon win+
                    minyonwin = minyonwin + cevapfonk[i];
                  }
                  if (cevapfonk[i + 1] == "kule Aldın") {
                    //kule win+
                    mevkisayi[13] = mevkisayi[13] + cevapfonk[i];
                  }
                  if (cevapfonk[i + 1] == "assist Aldın") {
                    //assit win
                    mevkisayi[7] = mevkisayi[7] + cevapfonk[i];
                  }
                  if (cevapfonk[i + 1] == "kill Aldın") {
                    //kill win+
                    mevkisayi[4] = mevkisayi[4] + cevapfonk[i];
                  }
                  cevapfonk[i] = 0;
                }
              }

              toplamfonkdegisken = 0;
              cevapsonucu = "${degiskensonuc[max * 8 + sonucsayi1]}";
            } else if (randomsans <= 49 + toplampuanfonk) {
              toplamfonkdegisken = toplampuanfonk / 4;
              if (skillcarpan <= 5) {
                if (skillsans <= yeteneksayi + 4) {
                  if (sayilar[9] > 0) {
                    cevapfonk[0] = 10 * skillcarpan; //minyon
                  } else if (sayilar[10] > 0) {
                    cevapfonk[4] = 1; //kule
                  } else if (sayilar[11] > 0) {
                    cevapfonk[2] = 1 * -skillcarpan; //olum
                  } else if (sayilar[12] > 0) {
                    cevapfonk[6] = 2 * skillcarpan; //assist
                  }
                } else if (randomsans <= 11.5 + toplamfonkdegisken) {
                  cevapfonk[2] = 1 * -skillcarpan; //olum
                } else if (randomsans <= 24 + toplamfonkdegisken * 2) {
                  cevapfonk[4] = 1; //kule
                } else if (randomsans <= 36.5 + toplamfonkdegisken * 3) {
                  cevapfonk[6] = 2 * skillcarpan; //assist
                } else if (randomsans <= 49 + toplamfonkdegisken * 4) {
                  cevapfonk[0] = 10 * skillcarpan; //minyon
                }
              }
              if (skillcarpan >= 6) {
                toplamfonkdegisken = toplampuanfonk / 9;
                if (skillsans <= yeteneksayi + 4) {
                  if (sayilar[9] > 0) {
                    cevapfonk[0] = 10 * sanssansi; //minyon
                  } else if (sayilar[10] > 0) {
                    cevapfonk[4] = 2; //kule
                  } else if (sayilar[11] > 0) {
                    cevapfonk[2] = -sanssansi; //olum
                  } else if (sayilar[12] > 0) {
                    cevapfonk[6] = 2 * sanssansi; //assist 69
                  }
                } else if (randomsans <= 4.55 + toplamfonkdegisken) {
                  cevapfonk[2] = -sanssansi; //olum
                } else if (randomsans <= 10.1 + toplamfonkdegisken * 2) {
                  cevapfonk[4] = 2; //kule
                } else if (randomsans <= 15.64 + toplamfonkdegisken * 3) {
                  cevapfonk[6] = sanssansi * 2; //assist
                } else if (randomsans <= 21.2 + toplamfonkdegisken * 4) {
                  cevapfonk[8] = sanssansi * 10; //minyon
                } else if (randomsans <= 26.75 + toplamfonkdegisken * 5) {
                  cevapfonk[10] = sanssansi;
                  bordalinan[12] = bordalinan[12] + sanssansi;
                  sonucgosterge[12] = sonucgosterge[12] + sanssansi;
                  //lose
                } else if (randomsans <= 32.30 + toplamfonkdegisken * 6) {
                  cevapfonk[14] = sanssansi; //güvenli
                  sayilar[5] = sayilar[5] - sanssansi;
                  sonucgosterge[14] = sonucgosterge[14] - sanssansi;
                } else if (randomsans <= 37.84 + toplamfonkdegisken * 7) {
                  cevapfonk[16] = sanssansi; //solo
                  sayilar[6] = sayilar[6] - sanssansi;
                  sonucgosterge[16] = sonucgosterge[16] - sanssansi;
                } else if (randomsans <= 43.39 + toplamfonkdegisken * 8) {
                  cevapfonk[18] = sanssansi; //takım
                  sayilar[7] = sayilar[7] - sanssansi;
                  sonucgosterge[18] = sonucgosterge[118] - sanssansi;
                } else if (randomsans <= 49 + toplamfonkdegisken * 9) {
                  cevapfonk[20] = sanssansi; // sans
                  sonucgosterge[20] = sonucgosterge[14] - sanssansi;
                  sayilar[3] = sayilar[3] - sanssansi;
                }
              }
              for (num i = 0; i <= 20; i = i + 2) {
                if (cevapfonk[i] > 0) {
                  bordalinan[i] = bordalinan[i] - cevapfonk[i];
                  sonucgosterge[i] = sonucgosterge[i] - cevapfonk[i];
                  cevapalinan = "${cevapfonk[i]} ${cevapfonk[i + 22]}";
                  if (cevapfonk[i + 22] == "minyon Kaybettin") {
                    //minyon lose+
                    minyonwin = minyonwin - cevapfonk[i];
                  }
                  if (cevapfonk[i + 22] == "kule Kaybettin") {
                    //kule lose+
                    mevkisayi[13] = mevkisayi[13] - cevapfonk[i];
                  }
                  if (cevapfonk[i + 22] == "assist Kaybettin") {
                    //assit lose+
                    mevkisayi[7] = mevkisayi[7] - cevapfonk[i];
                  }
                  if (cevapfonk[i + 22] == "Kere Öldün") {
                    //ölüm +
                    mevkisayi[10] = mevkisayi[10] - cevapfonk[i];
                  }
                  cevapfonk[i] = 0;
                }
              }

              toplamfonkdegisken = 0;
              cevapsonucu = "${degiskensonuc[max * 8 + sonucsayi2]}";
            }
          },
          child: new Text(
            "${cevaplar}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
