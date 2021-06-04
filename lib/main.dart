import 'package:flutter/material.dart';
import './quiz.dart';
import './reseult.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var studentrecordlist = ['haroon', 'khan', 'hangu', 20];

  var _questions = [
    {
      'questionText': 'What\'s your favorite Color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite Animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephent', 'score': 3},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite Teacher?',
      'answer': [
        {'text': 'Abdul Haseeb Malik', 'score': 10},
        {'text': 'Ms Sara Shahzad', 'score': 5},
        {'text': 'Dr Ibrar', 'score': 3},
        {'text': 'Dr Naeem ', 'score': 1}
      ],
    }
  ];

  var _questionIndex = 0;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('You have more Questions');
    } else {
      print('No more Questions there Sorry!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
