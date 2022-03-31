import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  )),
            ),
          ),
          TextField(
              // controller: textController!,
              ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              width: 50,
              color: Colors.pink,
              child: ElevatedButton(
                child: Text('Enter'),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 400,
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: ElevatedButton(
                        child: Text('$index'),
                        onPressed: () {},
                      ),
                      trailing: Text(
                        "Tahmin : 4598",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {},
                            child: Text('+1'),
                          ),
                          FloatingActionButton(
                            onPressed: () {},
                            child: Text('-2'),
                          ),
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}
