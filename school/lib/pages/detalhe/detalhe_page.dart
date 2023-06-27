import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:school/components/body_component.dart';
import 'package:school/components/spacer_component.dart';
import 'package:school/pages/detalhe/components/detalhe_header.dart';
import 'package:school/pages/detalhe/components/detalhe_menu_widget.dart';
import 'package:school/providers/afazer_provider.dart';
import 'package:school/services/picker_service.dart';
import 'components/detalhe_item_widget.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AfazerProvider store;
  int? index;

  void onEditImage () async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes());
      store.selecionado!.image = base64;
      store.atualizarItemAfazer(index!);
    }
  }

  void onDone() {
    store.selecionado!.isConcluido = true;
    store.atualizarItemAfazer(index!);
  }

  void onDelete() {
    store.excluirItem(index!);
    Navigator.pop(context);
  }

  void itemOnChanged(int indexItemChecked, bool value) {
    store.selecionado!.conteudos[indexItemChecked].isChecked = value;
    store.atualizarItemAfazer(index as int);
  }

  List<Widget> lista() {
    return store.selecionado!.conteudos.asMap().entries.map((elemento) {
      return DetalheItemWidget(
        item: elemento.value,
        onChanged:(val){ itemOnChanged(elemento.key, val ?? false);},
      );
    }).toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg != null) {
      index = arg as int;
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AfazerProvider>(context);
    if (store.selecionado == null) {
      return const Text('Selecione um item da lista');
    }
    return BodyComponent(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            DetalheHeaderWidget(
              onEdit: onEditImage,
              item: store.selecionado!,
            ),
            const SpacerComponent(),
            DetalheMenuWidget(
              item: store.selecionado!,
              onDone: onDone,
              onDelete: onDelete,
            ),
            const SpacerComponent(),
            ...lista(),
          ],
        ),
      ),
    );
  }
}