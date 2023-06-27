import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school/providers/afazer_provider.dart';

import '../../../components/icon_button_component.dart';
import '../../../components/spacer_component.dart';
import '../../../providers/config_provider.dart';

class PerfilTab extends StatefulWidget {
  const PerfilTab({super.key});

  @override
  State<PerfilTab> createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {
  late AfazerProvider store;
  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    storeConfig = Provider.of<ConfigProvider>(context);

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
            Row(
              children: [
                const Icon(Icons.list, color: Colors.black,),
                const SizedBox(width: 4),
                const Text('Total de notas: '),
                Text(store.listaAfazeres.length.toString())
              ]
            ),
            Row(
              children: [
              const Icon(Icons.done_all, color: Colors.black),
              const SpacerComponent(isHorizontal: true, size: 4,),
              const Text('Concluidas: '),
              Text(store.listaAfazeres.where((element) => element.isConcluido == true).toString())
              ]
            ),
            const SpacerComponent(),
            const Divider(),
                const Text('Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(children: [
                  const Text('Tema escuro'),
                  const SpacerComponent(isFull: true,),
                  Switch(
                    value: storeConfig.tema == ThemeMode.dark,
                    onChanged: (val) {
                    storeConfig.tema = val ? ThemeMode.dark: ThemeMode.light;
                  }),
                ],),

              ],
          
          ),
        );
  }
  }
