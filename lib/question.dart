import 'package:academind_quiz_app/sizeconfig.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Text(
      questionText,
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal * 5,
      ),
    );
  }
}
