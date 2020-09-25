import 'package:academind_quiz_app/sizeconfig.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(
    this.totalScore,
    this.resetQuiz,
  );
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your score is: " + totalScore.toString(),
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        if (totalScore < 50)
          Text("You're lame")
        else if (totalScore < 80)
          Text("You're not alright really")
        else if (totalScore < 100)
          Text("You're alright my G")
        else
          Text("You're peak most definitely"),
        SizedBox(
          height: 30,
        ),
        RaisedButton(
          child: Text('Reset quiz'),
          onPressed: resetQuiz,
        ),
      ],
    );
  }
}
