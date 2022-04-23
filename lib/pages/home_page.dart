import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sayiciklar/cubit/game_cubit.dart';
import 'package:sayiciklar/cubit/game_state.dart';
import 'package:sayiciklar/helpers/dialog_helper.dart';
import 'package:sayiciklar/helpers/logic_helper.dart';
import 'package:sayiciklar/models/tahmin.dart';
import 'package:sayiciklar/widgets/pin.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
      body: Container(
        color: Color.fromARGB(255, 199, 190, 111),
        child: BlocConsumer<GameCubit, GameState>(
          listener: (context, state) {
            if (state.tahmin.isNotEmpty && state.tahmin.last.artiBir == 4) {
              DialogHelper.showCupertinoDialog(context);
            }
          },
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
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                pin(textController),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: Text(
                        'Enter',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        final List<int> chose = [];
                        textController.text.characters.forEach((element) {
                          chose.add(int.parse(element));
                        });

                        final logicHelper = LogicHelper(
                            context.read<GameCubit>().randomInt, chose);
                        context.read<GameCubit>().enter(
                              Tahmin(
                                sayi: don(chose),
                                artiBir: logicHelper.arti(),
                                eskiBir: logicHelper.eksi(),
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
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Text(
                            '${liste.length - index}',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        trailing: Text(
                          'Tahmin : ${liste[index].sayi.toString()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(
                                liste[index].artiBir.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(
                                liste[index].eskiBir.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
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
      ),
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
