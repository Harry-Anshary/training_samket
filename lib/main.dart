import 'package:flutter/material.dart';
import 'package:kurir_samket_2/pages/home_page.dart';
import 'package:kurir_samket_2/pages/kalkulator_page.dart';
import 'package:kurir_samket_2/pages/kalkulator_rev_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kurir Sampah Market',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: false,
      ),
      home: HomePage(),
      routes: {
        '/kalkulatorpage' :(context) => KalkulatorPage(),
        '/kalkulatorpage2' :(context) => MyKalkulator(),
      },
    );
  }
}
