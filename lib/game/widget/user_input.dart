import 'package:example_roshambo/game/enum.dart';
import 'package:example_roshambo/game/widget/input_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput({
    this.userInput,
    required this.isDone,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          const Expanded(child: SizedBox.shrink()),
        ],
      );
    }

    return Row(
      children: _getInputs(callback),
    );
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map(
          (type) => InputCard(
            child: Image.asset(type.path),
            callback: () => callback.call(type),
          ),
        )
        .toList();
  }
}
