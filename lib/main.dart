import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;     
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s my favourite colour?',
      'answer': [
        {'text': 'Black', 'score': 4},
        {'text': 'Maroon', 'score': 3},
        {'text': 'Yellow', 'score': 1},
        {'text': 'Blue', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s my favourite animal?',
      'answer': [
        {'text': 'White Wolf', 'score': 4},
        {'text': 'Tiger', 'score': 1},
        {'text': 'Alpaca', 'score': 3},
        {'text': 'Fox', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\'s your favourite person?',
      'answer': [
        {'text': 'Siti', 'score': 1},
        {'text': 'Aisyah', 'score': 1},
        {'text': 'Aqilah', 'score': 1}
      ]
    },
  ];


  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
