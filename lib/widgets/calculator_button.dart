import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget 
{
    String character = "?";
    Function? onPress;

    CalculatorButton({Key? key, this.character = "?", this.onPress}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
      return OutlinedButton
      (
        onPressed: () => 
        {
          onPress!(character)
        },
        child: Text
        (
          character,
          style: const TextStyle(fontSize: 48),
        ),
      );
    }
}