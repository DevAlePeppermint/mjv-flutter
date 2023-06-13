import 'package:flutter/material.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';

class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  IconButtonComponent(
                    iconName: Icons.more_vert,
                    onPressed: () {print('IconButtonPressed');},
                    color: Colors.black
                    )
                ],
              ),
            ),

            const Text(
              'Minhas Estatísticas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
              ),
            const SpacerComponent(),
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
              SpacerComponent(isHorizontal: true, size: 4,),
              Text('Concluidas: '),
              Text('0')
              ]
            ),
            const SpacerComponent(),
            const Divider(),
                const Text('Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(children: [
                  const Text('Tema escuro'),
                  const SpacerComponent(isFull: true,),
                  Switch(value: true, onChanged: (val) {}),
                ],),

              ],
          
          ),
        );
  }
}