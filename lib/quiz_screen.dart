import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/suroo_servisteri.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  SurooServisteri servis = SurooServisteri();

  List<Widget> ikonkalar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(
                servis.surooAlipKel(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Column(
                children: [
                  knopkaniKur(
                    text: 'TRUE',
                    style: Theme.of(context).elevatedButtonTheme.style!,
                    onPressed: () {
                      jooptuTeksher(true);
                    },
                  ),
                  const SizedBox(height: 24),
                  knopkaniKur(
                    text: 'FALSE',
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Colors.red,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Colors.white,
                          ),
                        ),
                    onPressed: () {
                      jooptuTeksher(false);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Row(
                      children: ikonkalar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget knopkaniKur({
    required String text,
    required ButtonStyle style,
    required VoidCallback onPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: style,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
              ),
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void jooptuTeksher(bool koldonuuchununJoobu) {
    bool buttu = servis.buttu();
    bool kelgenTuuraJoop = servis.jooptuAlipKel();

    log('kelgenTuuraJoop = $kelgenTuuraJoop');
    log('koldonuuchununJoobu = $koldonuuchununJoobu');

    if (buttu == true) {
      log('buttu ========================');
      ikonkaKosh(kelgenTuuraJoop == koldonuuchununJoobu);
      kayradanBashta();
    }

    if (buttu == false) {
      log('buttu elek ========================');

      if (kelgenTuuraJoop == koldonuuchununJoobu) {
        ikonkaKosh(true);
      } else {
        ikonkaKosh(false);
      }
    }
  }

  void ikonkaKosh(bool tuuraniKosh) {
    if (tuuraniKosh == true) {
      ikonkalar.add(Icon(Icons.check, color: Colors.white));
    } else {
      ikonkalar.add(Icon(Icons.close, color: Colors.red));
    }

    setState(() {
      servis.kiyinkiSuroogoOt();
    });
  }

  void kayradanBashta() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Suroolor buttu'),
            content: const SingleChildScrollView(
              child: Text('Kayradan bashta'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  servis.kayradanBashta();
                  // ikonkalar = [];
                  ikonkalar.clear();
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
