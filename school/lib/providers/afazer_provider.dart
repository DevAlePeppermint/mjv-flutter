import 'package:flutter/material.dart';
import 'package:school/services/afazer_service.dart';
import '../entities/afazer_entity.dart';
import '../pages/home/components/novo_item_widget.dart';

class AfazerProvider with ChangeNotifier {
  final service = AfazerService();
  List<AfazerEntity> _listaAfazeres = [];

  AfazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AfazerEntity> get listaAfazeres =>_listaAfazeres;

  void atualizarItemAfazer(int index, String image) {
    listaAfazeres.elementAt(index).image = image;
    notifyListeners();
  }

  set listaAfazeres(List<AfazerEntity> val) {
    _listaAfazeres = val;
    notifyListeners();
  }

  void abrirModalCadastro(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        contentPadding: const EdgeInsets.all(16),
        children: [
          NovoItemWidget(callback: (itens) {
            listaAfazeres = [itens, ...listaAfazeres];
          },),
        ],
      );
    },);
  }

    void excluirItem(int indexDeleted) {
      listaAfazeres.removeAt(indexDeleted);
      service.salvar(listaAfazeres);
      notifyListeners();
  }
}