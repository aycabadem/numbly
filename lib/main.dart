import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayiciklar/cubit/game_cubit.dart';
import 'package:sayiciklar/pages/enter_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GameCubit(),
    child: MyApp(),
  ));
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
    );
  }
}
