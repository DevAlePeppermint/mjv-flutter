import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school/app_routes/app_routes.dart';
import 'package:school/entities/afazer_entity.dart';

import '../../../providers/afazer_provider.dart';
import '../components/item_widget.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key,});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late AfazerProvider store;
  
  void excluirItem(int indexDeleted) {
    store.excluirItem(indexDeleted);
  }

  // void onDetalhes() {
  void onDetalhes(AfazerEntity item, int idx) {
    Navigator.pushNamed(context, AppRoutes.detalhe);
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
    return ListView.builder(
      // builder - renderiza o que queremos
      itemCount: store.listaAfazeres.length,
      // context - contexto, no caso a pagina q está rodando
      itemBuilder: (context, index) {
        final item = store.listaAfazeres.elementAt(index);
        return Dismissible(
          key: Key(item.uuid),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              excluirItem(index);
            }
          },
          child: ItemWidget(
            item: item,
            onPressed: () {
              onDetalhes(item, index);
            },
          ),
        );
      },
    );
  }
}