import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget pin(TextEditingController textController) {
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
    onCompleted: (pin) {
      final List<int> deneme = [];
      pin.characters.forEach((element) {
        deneme.add(int.parse(element));
      });

      if (deneme[0] == 0) {
        textController.clear();
      }
      for (int i = 1; i < 4; i++) {
        if (deneme[0] == deneme[i]) {
          textController.clear();
        }
      }
      for (int i = 2; i < 4; i++) {
        if (deneme[1] == deneme[i]) {
          textController.clear();
        }
      }
      if (deneme[2] == deneme[3]) {
        textController.clear();
      }
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => Logic(chosen: chose)));
      // textController!.text = '';
      // debugPrint(chose.toString());
    },
  );
}
