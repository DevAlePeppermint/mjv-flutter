import 'package:flutter/material.dart';

import '../../../components/spacer_component.dart';

class ItemWidget extends StatelessWidget {
  final item;
  final index;
  final Function excluirItem;

  const ItemWidget({
    super.key, 
    required this.item,
    required this.index,
    required this.excluirItem
  });

  Widget status() {
    final icon = item.isConcluido == true ? 
      const Icon(Icons.done_all, color: Colors.green,) : const Icon(Icons.done, color: Colors.grey,);
    return icon;
  }


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.uuid),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(children: [
            status(),
            const SpacerComponent(size: 8, isHorizontal: true,),
            Text(item.titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ]),
        ),
      ),
      onDismissed: (direction) {
        if(direction == DismissDirection.startToEnd) {
          excluirItem(index);
        }
      },
    );
  }
}