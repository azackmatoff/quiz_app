import 'dart:developer';

import 'package:flutter/material.dart';

class SabakScreen extends StatefulWidget {
  const SabakScreen({Key? key}) : super(key: key);

  @override
  _SabakScreenState createState() => _SabakScreenState();
}

class _SabakScreenState extends State<SabakScreen> {
  /// Flutter framework
  /// Dart language, strongly typed

  /// Null-safety, null = nullable, danniy bar = non-nullable
  String name = 'Azamat'; // [name] non-nullable, null bersen bolboyt,
  // sozsuz danniy berilishi kerek
  late int id;

  String? lastname; // [lastname] nullable, null bersen bolot

  /// variant 1
  // Adam adam = Adam(id: 40, familiya: 'Doe', aty: 'Jack');

  /// variant 2
  // Adam adam = Adam('Jane', 'Doe', 20);

  /// variant 3
  // Adam adam = Adam('Azat', 'Aytmatov');

  /// variant 4
  Adam adam = Adam(familiya: 'Doe', aty: 'Jack');

  // Array, massiv  //0, 1, 2, 3, 4 // eseptoo 0-don bashtalat, 1-den emes
  List<int> baalar = [1, 2, 3, 4, 5];

  void eskiBaalardiKosh() {
    baalar.addAll(eskiBaalar);
  }

  void baalardyKir() {
    baalar.add(10);
    baalar.add(100);
    baalar.add(3);
    baalar.add(5);
    baalar.add(2);
  }

  List<int> eskiBaalar = [3, 4, 5, 3, 4, 5, 4, 2, 7];

  @override
  void initState() {
    // for loop
    /// variant 1
    // for (int i = 0; i < eskiBaalar.length; i++) {
    //   log('i = $i');
    //   int baa = eskiBaalar[i];

    //   log('baa = $baa');
    // }

    // /// variant 2
    // for (var baa in eskiBaalar) {
    //   log('2 baa = $baa');
    // }

    log('1 baalardin ichinde kancha baa bar = ${baalar.length}');
    // tizmenege en akirki kilip kosh
    baalar.insert(baalar.length - 1, 100);

    /// tizmede 3-chu kilip kosh, 0, 1, 2
    baalar.insert(2, 5);

    /// tizmege bashka tizmeni 1-chi kilip kosh
    baalar.insertAll(0, eskiBaalar);

    int index = baalar.indexOf(5);

    log('index = $index');

    log('2 baalardin ichinde kancha baa bar = ${baalar.length}');
    log('2 baalar ekinchi baa = ${baalar[1]}');

    // baalardyKir();

    // log('2 baalardin ichinde kancha baa bar = ${baalar.length}');

    // eskiBaalardiKosh();

    // log('3 eski baalardin ichinde kancha baa bar = ${eskiBaalar.length}');
    // log('3 baalardin ichinde kancha baa bar = ${baalar.length}');

    // log('baalar birinchi baa = ${baalar[0]}');
    // log('baalar akirki baa = ${baalar[baalar.length - 1]}');

    // log('baalar ekinchi baa = ${baalar[1]}');

    lastname = 'Smith';
    id = 45;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name = $name',
              style: const TextStyle(fontSize: 42, color: Colors.white),
            ),
            Text(
              'Lastname = ${lastname!}',
              style: const TextStyle(fontSize: 42, color: Colors.white),
            ),
            Text(
              'ID = $id',
              style: const TextStyle(fontSize: 42, color: Colors.white),
            ),
            // Text(
            //   'Aty: ${adam.aty}',
            //   style: const TextStyle(fontSize: 42, color: Colors.white),
            // ),
            // Text(
            //   'Familiyasi: ${adam.familiya}',
            //   style: const TextStyle(fontSize: 42, color: Colors.white),
            // ),
            // Text(
            //   'ID: ${adam.id ?? ''}',
            //   style: const TextStyle(fontSize: 42, color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}

/// variant 1
// class Adam {
//   final String aty;
//   final String familiya;
//   final int id;

//   Adam({required this.aty, required this.familiya, required this.id});
// }

/// variant 2
// class Adam {
//   final String aty;
//   final String familiya;
//   final int id;

//   Adam(this.aty, this.familiya, this.id);
// }

/// variant 3
// class Adam {
//   final String aty;
//   final String familiya;
//   final int? id;

//   Adam(this.aty, this.familiya, [this.id]);
// }

/// variant 4
class Adam {
  final String aty;
  final String familiya;
  final int? id;

  Adam({required this.aty, required this.familiya, this.id});
}
