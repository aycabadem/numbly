import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:sayiciklar/cubit/game_cubit.dart';
import 'package:sayiciklar/cubit/game_state.dart';
import 'package:sayiciklar/helpers/logic_helper.dart';
import 'package:sayiciklar/models/tahmin.dart';

class MyHomePage extends StatefulWidget {
  final List<int> random;

  const MyHomePage({Key? key, required this.title, required this.random})
      : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  int sayac = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '4 Basamakli Bir Sayi Gir',
                      style: TextStyle(fontSize: 24, color: Colors.blue),
                    ),
                  ),
                ),
              ),
              pin(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: 200,
                  child: ElevatedButton(
                    child: Text('Enter'),
                    onPressed: () {
                      final List<int> chose = [];
                      textController.text.characters.forEach((element) {
                        chose.add(int.parse(element));
                      });

                      context.read<GameCubit>().enter(
                            Tahmin(
                              sayi: don(chose),
                              artiBir: LogicHelper(widget.random, chose).arti(),
                              eskiBir: LogicHelper(widget.random, chose).eksi(),
                              tur: sayac,
                            ),
                          );
                      textController.text = '';
                      debugPrint(chose.toString());
                      sayac++;
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.tahmin.length,
                  itemBuilder: (context, index) {
                    final liste = state.tahmin.reversed.toList();
                    return ListTile(
                      leading: ElevatedButton(
                        child: Text('${liste.length - index}'),
                        onPressed: () {},
                      ),
                      trailing: Text(
                        liste[index].sayi.toString(),
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Row(
                        children: [
                          CircleAvatar(
                            child: Text(liste[index].artiBir.toString()),
                          ),
                          CircleAvatar(
                            child: Text(liste[index].eskiBir.toString()),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget pin() {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      controller: textController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return null;
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      // onCompleted: (pin) {
      //   final List<int> chose = [];
      //   pin.characters.forEach((element) {
      //     chose.add(int.parse(element));
      //   });
      //   Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => Logic(chosen: chose)));
      //   textController!.text = '';
      //   debugPrint(chose.toString());
      // },
    );
  }

  int don(List<int> liste) {
    int sayi = 0;

    for (int i = 0; i < 4; i++) {
      sayi += liste.reversed.toList()[i] * pow(10, i).toInt();
    }
    return sayi;
  }
}
