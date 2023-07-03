import 'package:flutter/material.dart';

class wiki extends StatefulWidget {
  @override
  _NeiseYarar createState() => _NeiseYarar();
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

class _NeiseYarar extends State<wiki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 300),
                child: CustomBackButton(),
              ),
            ),
            ListTile(
                tileColor: Colors.blue,
                title: Column(
                  children: [
                    Text(
                        "KARAKTER PUANI(KP):Karakter puanları oynun gidişatını zamana dayalı olarak değiştiren özelliktir. Her 10 karakter açmak 1 Karakter Puanı verir. (Özellikler aşşağıdadır)"),
                    list(
                        "Oyun bitene kadar minyon biçme     oranınızı arttırır",
                        "assets/images/minyon1.png"),
                    list("Oyun bitene kadar ölme oranınızı azaltır",
                        "assets/images/safe.png"),
                    list("Oyun bitene kadar kill alma oranınızı artırır",
                        "assets/images/agresif.png"),
                  ],
                )),
            ListTile(
                tileColor: Colors.red,
                title: Column(
                  children: [
                    Text(
                        "GİF PUANI(GF):Gif Puanları soru türüne bağlı olarak win alma şansınızı arttırır. Her karakterle alınan 3 win 1 Gif Puanı verir. (Özellikler aşşağıdadır)"),
                    list("Güvenli cevaplarında kazanma oranını arttırır",
                        "assets/images/sans.png"),
                    list("Solo cevaplarında kazanma oranını arttırır",
                        "assets/images/tecrübe.png"),
                    list("Takım cevaplarında gecinme oranını arttırır",
                        "assets/images/karakter.png"),
                    list(
                        "Şans cevaplarında kazanma oranını arttırır(kule alma şansınıda küçükte olsa arttırır)",
                        "assets/images/kule.png")
                  ],
                )),
            ListTile(
                tileColor: Colors.yellow,
                title: Column(
                  children: [
                    Text(
                        "DERECE PUANI(DP):Derece puanları sorunun cevabına göre alınan kill,minyon,kule, ve ölme(oranını düşürür) oranlarını çarparak ekleme yapar. Her 1 küme atlama 1 Derece Puanı verir. (Özellikler aşşağıdadır)"),
                    list(
                        "Cevaplardan kill gelme oranını arttırma(aynı oranda cevaplardan minyon kaybetme oranını arttırma)",
                        "assets/images/minyoncarpan.png"),
                    list(
                        "Cevaplardan assist gelme oranını arttırma(aynı oranda cevaplardan kule kaybetme oranını arttırma)",
                        "assets/images/killcarpanı.png"),
                    list(
                        "Cevaplardan kule gelme şansını arttırma(aynı oranda cevaplardan ölme oranını arttırma)",
                        "assets/images/assist.png"),
                    list(
                        "Cevaplardan minyon gelme şansını arttırma(aynı oranda cevaplardan assist gelme oranını azaltma)(",
                        "assets/images/ölüm.png")
                  ],
                ))
          ],
        )));
  }

  Row list(String yazi, String avatar) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("$avatar"),
        ),
        Expanded(
            child:
                Padding(padding: EdgeInsets.only(left: 10), child: Text(yazi))),
      ],
    );
  }
}
