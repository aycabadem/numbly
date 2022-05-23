import 'package:flutter/material.dart';
import 'package:sayiciklar/pages/home_page.dart';
import 'dart:math';

import 'package:sayiciklar/pages/info_page.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Numbly')),
      body: Container(
        color: Color.fromARGB(255, 137, 167, 190),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                      'Numbly is a game to find a randomly generated 4-digit number. Press play to start'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  //setState(() {});
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InfoPage()));
                },
                child: Text('How can I play?'),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    //setState(() {});
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: 'Numbly',
                            )));
                  },
                  child: Text(
                    'Play',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
