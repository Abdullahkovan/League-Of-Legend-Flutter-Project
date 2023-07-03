import 'package:lolproje/sampiyon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Detaylar.dart';

Champion sampiyon = Champion();

List<String> strlist = [""];
int deneme = 34;

class veri {
  static SharedPreferences _sharedPrefObject;
  Future<void> createSharedPrefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void kaydedilenler() {
    _sharedPrefObject.setInt("kümepuanı$deneme", puan);
    _sharedPrefObject.setInt("gifpuanı$deneme", gf);
    _sharedPrefObject.setInt("gifpuanıkayıt$deneme", gifpuan);
    _sharedPrefObject.setInt("kumeresim$deneme", kumeresim);
    _sharedPrefObject.setInt("toplampuan$deneme", toplampuan);
    _sharedPrefObject.setInt("karakteracma$deneme", sayi);
    _sharedPrefObject.setStringList("karakterlist$deneme", karakterlerlist);
    _sharedPrefObject.setInt("list$deneme", listarttirma);
    _sharedPrefObject.setInt("karakterpuan$deneme", karakterpuan);
    _sharedPrefObject.setInt("kp$deneme", kp);
    _sharedPrefObject.setInt("degisen$deneme", degisen);
    _sharedPrefObject.setStringList("sampiyonpuan$deneme", sampiyonismi);
    for (int i = 0; i < degisen; i++) {
      _sharedPrefObject.setInt("$i$deneme", sampiyonpuani[i]);
    }
  }

  void yuklenenler() async {
    puan = _sharedPrefObject.getInt("kümepuanı$deneme") ?? 0;
    gf = _sharedPrefObject.getInt("gifpuanı$deneme") ?? 0;
    gifpuan = _sharedPrefObject.getInt("gifpuanıkayıt$deneme") ?? 0;
    kumeresim = _sharedPrefObject.getInt("kumeresim$deneme") ?? 1;
    toplampuan = _sharedPrefObject.getInt("toplampuan$deneme") ?? 0;
    sayi = _sharedPrefObject.getInt("karakteracma$deneme") ?? 3;
    karakterlerlist =
        _sharedPrefObject.getStringList("karakterlist$deneme") ?? ["", "", ""];
    listarttirma = _sharedPrefObject.getInt("list$deneme") ?? 0;
    karakterpuan = _sharedPrefObject.getInt("karakterpuan$deneme") ?? 0;
    kp = _sharedPrefObject.getInt("kp$deneme") ?? 0;
    degisen = _sharedPrefObject.getInt("degisen$deneme") ?? 0;
    sampiyonismi =
        _sharedPrefObject.getStringList("sampiyonpuan$deneme") ?? ["", "", ""];
    for (int i = 0; i < degisen; i++) {
      sampiyonpuani[i] = _sharedPrefObject.getInt("$i$deneme") ?? [0, 0, 0];
    }
  }
}
