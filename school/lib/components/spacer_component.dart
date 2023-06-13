import 'package:flutter/material.dart';

class SpacerComponent extends StatelessWidget {
  final double size;
  // final double? size; - null ou double
  final bool isFull;
  final bool isHorizontal;

  const SpacerComponent({ //constructor
    Key? key,
    this.size = 16,
    this.isFull = false, // usuario precisa passar, obrigatorio
    // required this.isFull, // usuario precisa passar, obrigatorio
    this.isHorizontal = false,

  }): super(key: key);

  @override
  // decorator: coloca pré requisitos em um método
  Widget build(BuildContext context) {
    if (isFull) {
      return const Spacer();
    } 
    if (isHorizontal) {
      return SizedBox(width: size);
    }
    return SizedBox(height: size);

    // do professor:
    // if (isFull == true) {
    //   return const Spacer();
    // }

    // return SizedBox(
    //   height: size,
    //   width: isHorizontal? size : null,
    // )
  }
}