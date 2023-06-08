// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return MaterialApp(
      title: 'School',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Card(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.only(right: 8),
                        child: const CircleAvatar(child: Text('A')),
                      ),
                      const Text('Alexandra Gropp', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],)
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert, color: Colors.black,)
                ],
              ),
            ),

            const Text(
              'Minhas Estatísticas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
              ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.list, color: Colors.black,),
                SizedBox(width: 4),
                Text('Total de notas: '),
                Text('0')
              ]
            ),
            const Row(
              children: [
              Icon(Icons.done_all, color: Colors.black),
              SizedBox(width: 4),
              Text('Concluidas: '),
              Text('0')
              ]
            ),
            const SizedBox(height: 16,),
            const Divider(),
                const Text('Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(children: [
                  const Text('Tema escuro'),
                  const Spacer(),
                  Switch(value: true, onChanged: (val) {}),
                ],)
              ],
          
          ),
        )
      )
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

