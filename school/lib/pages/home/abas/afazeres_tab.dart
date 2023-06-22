import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entities/afazer_entity.dart';

import '../../../providers/afazer_provider.dart';
import '../components/item_widget.dart';
import '../components/novo_item_widget.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key,});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late AfazerProvider store;

  void handleAdicionar() {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(16),
        children: [
          NovoItemWidget(callback: (itens) {
            store.listaAfazeres = [...store.listaAfazeres, itens];
          },),
        ],
      );
    },);
  }

  
  void excluirItem(int indexDeleted) {
    // _listaAFazeres.removeAt(indexDeleted);
    // setState(() {
    //   _listaAFazeres = _listaAFazeres;
    // });
  }

  @override
  // useEffect
  // sempre que for atribuir valor a uma variavel, colocar num initState
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    return Column(children: [
      ElevatedButton(onPressed: handleAdicionar, child: const Text('Adicionar')),
      const SpacerComponent(),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: ListView.builder(
          // builder - renderiza o que queremos
          itemCount: store.listaAfazeres.length,
          // context - contexto, no caso a pagina q está rodando
          itemBuilder: (context, index) {
            final item = store.listaAfazeres.elementAt(index);
            return ItemWidget(item: item, index: index, excluirItem: excluirItem,);
          },
        )
      ,)
    ],);
  }
}