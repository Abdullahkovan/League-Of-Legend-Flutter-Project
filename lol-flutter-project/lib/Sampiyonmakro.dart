import 'package:flutter/material.dart';

String ad = "";

class sampiyonmakro {
  Hero bandlesampiyonlar(String image, String isim) {
    ad = isim;
    return Hero(
      tag: isim,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
