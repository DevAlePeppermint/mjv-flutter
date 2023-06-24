import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school/components/body_component.dart';
import 'package:school/pages/home/abas/afazeres_tab.dart';
import 'package:school/pages/home/abas/perfil_tab.dart';
import '../../components/app_bar_component.dart';
import '../../providers/afazer_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  late AfazerProvider store;
  late int indexAtual;

  @override
  void initState() {
    indexAtual = 0;
    store = Provider.of<AfazerProvider>(context, listen: false);
    super.initState();
  }

  void handleTab(int tabIndex) {
    setState(() {
      indexAtual = tabIndex;
    });
  }

    @override
    Widget build(BuildContext context) {

    final List<BottomNavigationBarItem> _abas = [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil'
          ),
    ]; //variavel privada

    final List<Widget> _conteudos = [
      AfazeresTab(),
      const PerfilTab(),
    ];

    return BodyComponent(
      bar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            indexAtual = index;
          });
        },
        currentIndex: indexAtual,
        items: _abas,
      ),
      actionButton: FloatingActionButton(
        onPressed: () {
          store.abrirModalCadastro(context);
        },
        child: const Icon(Icons.add)
      ),
      child: _conteudos.elementAt(indexAtual)
    );
  }
}
