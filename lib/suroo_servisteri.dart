import 'dart:developer';

import 'package:quiz_app/suroo.dart';

class SurooServisteri {
  int index = 0;
  List<Suroo> suroolor = [
    const Suroo(text: 'Kyrgyzstandyn borboru Bishkek', joop: true), // 0
    const Suroo(text: 'Duynodogu en biyik too Ala-Too', joop: false), // 1
    const Suroo(text: '2+2=5', joop: false), // 2
    const Suroo(text: '10+1 = 11', joop: true), // 3
    const Suroo(text: '1+1=3', joop: false), //4
    const Suroo(text: '1+1=2', joop: true), //5
  ];

  String surooAlipKel() {
    return suroolor[index].text;
  }

  bool jooptuAlipKel() {
    return suroolor[index].joop;
  }

  void kiyinkiSuroogoOt() {
    log('1 kiyinkiSuroogoOt index = $index suroolor = ${suroolor.length}');
    if (index < suroolor.length - 1) {
      index++;
    }

    log('2 kiyinkiSuroogoOt index = $index suroolor = ${suroolor.length}');
  }

  bool buttu() {
    return index == suroolor.length - 1;
  }

  void kayradanBashta() {
    index = 0;
  }
}
