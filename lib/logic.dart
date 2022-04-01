import 'package:flutter/material.dart';

class Logic extends StatefulWidget {
  final List<int> chosen;
  final List<int> random;
  const Logic({Key? key, required this.chosen, required this.random})
      : super(key: key);

  @override
  State<Logic> createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  int artiBir = 0;
  int eksiBir = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Numbly')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  arti();
                  eksi();
                  setState(() {});
                },
                child: Text('görrr'),
              ),
              Text('$artiBir'),
              Text('$eksiBir'),
            ],
          ),
        ),
      ),
    );
  }

  int arti() {
    artiBir = 0;
    int i;
    for (i = 0; i < 4; i++) {
      if (widget.random[i] == widget.chosen[i]) {
        artiBir++;
      }
    }

    return artiBir;
  }

  int eksi() {
    eksiBir = 0;
    for (int i = 0; i < 4; i++) {
      if (widget.random.contains(widget.chosen[i])) {
        if (widget.random[i] != widget.chosen[i]) {
          eksiBir--;
        }
      }
    }

    return eksiBir;
  }
}
