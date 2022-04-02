import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayiciklar/cubit/game_cubit.dart';

class DialogHelper {
  String cem = 'cem';
  static void showCupertinoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Dialog'),
          content: Text('Hey! I am Coflutter!'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  BlocProvider.of<GameCubit>(context).clear();
                  Navigator.of(context).pop();
                },
                child: Text('Tekrar oyna')),
          ],
        );
      },
    );
  }
}
