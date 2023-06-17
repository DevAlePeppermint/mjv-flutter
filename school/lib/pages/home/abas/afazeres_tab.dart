import 'package:flutter/material.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entities/afazer_entity.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key,});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late List<AfazerEntity> _listaAFazeres;

  void adicionaItem() {
    final item = AfazerEntity(
          uuid: 'teste3',
          titulo: 'Teste3',
          dataInicio: DateTime.now(),
          dataFim: DateTime.now(),
          isConcluido: true,
    );

    _listaAFazeres.add(item);

    setState(() {
      _listaAFazeres = _listaAFazeres;
    });
  }

  
  void excluirItem(int indexDeleted) {
    _listaAFazeres.removeAt(indexDeleted);
    setState(() {
      _listaAFazeres = _listaAFazeres;
    });
  }

  @override
  // useEffect
  // sempre que for atribuir valor a uma variavel, colocar num initState
  void initState() {
    _listaAFazeres = [
      AfazerEntity(
        uuid: 'teste1',
        titulo: 'Teste1',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: false,
      ),
      AfazerEntity(
        uuid: 'teste2',
        titulo: 'Teste2',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: true,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(onPressed: adicionaItem, child: const Text('Adicionar')),
      const SpacerComponent(),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: ListView.builder(
          // builder - renderiza o que queremos
          itemCount: _listaAFazeres.length,
          // context - contexto, no caso a pagina q está rodando
          itemBuilder: (context, index) {
            final item = _listaAFazeres.elementAt(index);
            return Dismissible(
              key: Key(item.uuid),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(children: [
                    item.isConcluido == true ? Icon(Icons.done_all, color: Colors.green,): Icon(Icons.done),
                    SpacerComponent(size: 8, isHorizontal: true,),
                    Text(item.titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ]),
                ),
              ),
              onDismissed: (direction) {
                if(direction == DismissDirection.startToEnd) {
                  excluirItem(index);
                }
              },
            );
          },
        )
      ,)
    ],);
  }
}