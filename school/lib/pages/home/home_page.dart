import 'package:flutter/material.dart';
import 'package:school/pages/home/abas/afazeres_tab.dart';
import 'package:school/pages/home/abas/perfil_tab.dart';
import '../../components/app_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  late int indexAtual;

  @override
  void initState() {
    indexAtual = 0;
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

    return Scaffold(
      appBar: const AppBarComponent(titulo: 'School'),
      body: _conteudos.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            indexAtual = index;
          });
        },
        currentIndex: indexAtual,
        items: _abas,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add)
      ),
    );
  }
}
