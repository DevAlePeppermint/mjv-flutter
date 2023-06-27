import 'package:flutter/material.dart';
import 'package:school/components/icon_button_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/entities/afazer_entity.dart';

class DetalheMenuWidget extends StatelessWidget {
  final AfazerEntity item;
  final Function() onDone;
  final Function() onDelete;

  const DetalheMenuWidget({
    super.key,
    required this.item,
    required this.onDone,
    required this.onDelete,
  });


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if(item.conteudos.isNotEmpty) 
        const Text(
          'Tarefas',
          style: TextStyle(fontSize: 24),
        ),
      const SpacerComponent(isFull: true),
      IconButtonComponent(
        onPressed: onDone,
        iconName: (item.isConcluido == true) ? Icons.done_all : Icons.done,
        size: 18, 
        color: (item.isConcluido == true) ? Colors.green : Colors.grey[600],
      ),
      IconButtonComponent(
        onPressed: onDelete,
        iconName: Icons.delete_forever,
        size: 18, 
        color: Colors.red,
      )
    ],);
  }
}