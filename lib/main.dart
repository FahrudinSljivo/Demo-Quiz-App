import 'package:academind_quiz_app/answer.dart';
import 'package:academind_quiz_app/question.dart';
import 'package:academind_quiz_app/result.dart';
import 'package:academind_quiz_app/sizeconfig.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentQuestion = 0;
  int totalScore = 0;

  void onButtonPressed(int answerScore) {
    setState(() {
      currentQuestion++;
      totalScore += answerScore;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestion = 0;
      totalScore = 0;
    });
  }

  final questions = [
    {
      'question': 'What\'s your favorite COH2 faction?',
      'answers': [
        {'score': 10, 'answer': 'USF'},
        {'score': 20, 'answer': 'Soviet'},
        {'score': 30, 'answer': 'Wehrmacht'},
        {'score': 40, 'answer': 'OKW'},
      ]
    },
    {
      'question': 'Who\'s your favorite MKX character?',
      'answers': [
        {'score': 10, 'answer': 'Reptile'},
        {'score': 20, 'answer': 'Kenshi'},
        {'score': 30, 'answer': 'Sub-Zero'},
        {'score': 40, 'answer': 'Johnny Cage'},
      ]
    },
    {
      'question': 'What\'s your favorite BF3 map?',
      'answers': [
        {'score': 10, 'answer': 'Kharg Island'},
        {'score': 20, 'answer': 'Damavand Peak'},
        {'score': 30, 'answer': 'Caspian Border'},
        {'score': 40, 'answer': 'Operation Firestorm'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: currentQuestion < questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Question(questions[currentQuestion]['question']),
                    ),
                  ),
                  ...(questions[currentQuestion]['answers'] as List<Object>)
                      .toList()
                      .map(
                        (e) => Answer(
                          (e as Map)['answer'],
                          () => onButtonPressed((e as Map)['score']),
                        ),
                      ),
                ],
              )
            : Result(
                totalScore,
                resetQuiz,
              ),
      ),
    );
  }
}
