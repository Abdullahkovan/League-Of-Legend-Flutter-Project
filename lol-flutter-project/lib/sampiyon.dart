import 'package:lolproje/Kartlar.dart';

import 'Hikaye.dart';

Hikayeveri Hikaye = Hikayeveri();

class Champion {
  final String isim;
  final String soyisim;
  final Roller rol;
  final Difficulty zorluk;
  final String hikaye;
  int puani;

  Champion(
      {this.isim,
      this.soyisim,
      this.zorluk,
      this.rol,
      this.hikaye,
      this.puani});
}

final bandleMap = {
  "poppy": tumsampiyonlar(
      "Poppy", Roller.nisanci, Difficulty.MODERATE, "poppy", "ÇEKİÇ USTASI", 0),
  "tristana": tumsampiyonlar("Tristana", Roller.nisanci, Difficulty.MODERATE,
      "tristana", "ÇEKİÇ USTASI", 0),
};
final BilgewaterMap = {
  "akali": tumsampiyonlar(
      "Akali", Roller.nisanci, Difficulty.MODERATE, "akali", "ÇEKİÇ USTASI", 0),
};
Champion tumsampiyonlar(String isimi, var Rolu, var zorlugu, String dogrulamasi,
    String unvan, int gifpuani) {
  return Champion(
    isim: isimi,
    rol: Rolu,
    zorluk: zorlugu,
    soyisim: dogrulamasi,
    hikaye: unvan,
    puani: gifpuani,
  );
}
