// import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:dice_app/styled_text.dart';
import 'package:dice_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GrediantContainer extends StatelessWidget {
  const GrediantContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors, begin: startAlignment, end: endAlignment),
      ),
      child: const Center(
        // child: StyledText("Hello world!"),
        child: DiceRoller(),
      ),
    );
  }
}
