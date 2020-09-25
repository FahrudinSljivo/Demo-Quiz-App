import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function onButtonPressed;

  Answer(this.answerText, this.onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(answerText),
      onPressed: onButtonPressed,
    );
  }
}
