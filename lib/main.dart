import 'package:flutter/material.dart';
import 'package:sayiciklar/pages/enter_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(98, 132, 203, 236),
          secondary: const Color.fromARGB(97, 2, 53, 77),
        ),
      ),
      home: EnterPage(),
      //const MyHomePage(title: 'Numberly Game'),
    );
  }
}
