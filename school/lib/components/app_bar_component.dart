import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  // extend: extende de alguma coisa (ex: StatelessWidget, StatefullWidget)
  // implements: implementa um contrato, diretrizes, que o AppBarComponent precisa ter
  const AppBarComponent({
    Key? key,
    this.titulo = 'School',
  }) : super(key: key);

  static Size get size => const Size.fromHeight(kToolbarHeight);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(titulo));
  }
}