import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  final double size;
  final Color? color;
  final IconData iconName;
  final Function() onPressed;

    const IconButtonComponent({ //constructor
    Key? key,
    required this.onPressed,
    this.iconName = Icons.add,
    this.color,
    this.size = 24,

  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconName),
      onPressed: onPressed,
      color: color,
      iconSize: size,
    );
  }
}

// componente de botao reutilizavel que receba icone, ação, que possa ser reutilizavel

// iconButton(icon, onpressed: ())