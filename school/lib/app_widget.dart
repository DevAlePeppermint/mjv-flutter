// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      title: 'School',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(child: Text('A'),),
              const Text('Texto 1'),
              const Text('Texto 2'),
              const Text('Texto 3'),
              const Divider(),
              const Row(children: [
                Icon(Icons.add, color: Colors.green,),
                SizedBox(width: 100, height: 100),
                Spacer(),
                Icon(Icons.access_alarm, color: Colors.red,),
              ],
              ),
              Switch(value: true, onChanged: (val) {}),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Alexandra linda')),
              )
            ],
          ),
        )
      )
    );

    return const MaterialApp(
      title: 'School',
      home: HomePage()
    );
    
    
    // CupertinoApp(
    //   theme: CupertinoThemeData(brightness: Brightness.light),
    //   home: CupertinoPageScaffold(
    //     child: Center(
    //       child: CupertinoButton.filled(
    //         child: Text('Botão'), onPressed: () {}
    //       )
    //     )
    //   ),
    // );
  }
}

