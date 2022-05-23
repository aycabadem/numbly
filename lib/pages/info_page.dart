import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbly'),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('You start the game by typing a random number.'),
            ),
            ListTile(
              title: Text('The numbers must be different from each other.'),
            ),
            ListTile(
              title: Text('Then you get a feedback on this number you wrote.'),
            ),
            ListTile(
              title: Text(
                ' If the number you guessed has the number you need to know and is in the same position, you win +1. ',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ListTile(
              title: Text(
                ' And if the position is different but the number is the same you get -1.',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              title: Text('For example:'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Random Number :'),
                CircleAvatar(child: Text('1')),
                CircleAvatar(child: Text('2')),
                CircleAvatar(
                  child: Text('3'),
                  backgroundColor: Colors.green,
                ),
                CircleAvatar(
                  child: Text('4'),
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Your Number:       '),
                CircleAvatar(child: Text('1')),
                CircleAvatar(child: Text('2')),
                CircleAvatar(
                  child: Text('0'),
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  child: Text('3'),
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Feedback :    +2   -1',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Text(
                  'This way you keep guessing and when you get +4 as a comeback, the game is over.'),
            ),
          ],
        ),
      ),
    );
  }
}
