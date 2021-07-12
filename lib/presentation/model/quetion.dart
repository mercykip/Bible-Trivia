import 'package:bible_trivia/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';

class Question {
  String question;
  bool answer;
  String choice;
  String questionNo;

  Question(this.questionNo, this.question, this.answer, this.choice);
}

class TriviaQuestion {
  int _triviaQuestionNo = 0;

  List<Question> _bibleTrivia = [
    Question('Question 1.', 'In what city was Jesus born? ', true, 'Bethlehem'),
    Question('Question 2.', 'How many books are in the New Testament? ', false,
        '36'),
    Question(
        'Question 3.',
        'What type of insect did John the Baptist eat in the desert? ',
        true,
        'Locusts'),
    Question(
        'Question 4.',
        'Who were the first apostles called to follow Jesus?',
        false,
        'Peter and simon'),
    Question(
      'Question 5.',
      'How many people did Jesus feed with five loaves of bread and two fish?',
      true,
      'about 5000 men',
    )
  ];

  void nextQuestion() {
    if (_triviaQuestionNo < _bibleTrivia.length - 1) {
      _triviaQuestionNo++;
    }
  }

  String getQuestionNo() {
    return _bibleTrivia[_triviaQuestionNo].questionNo;
  }

  String getQuestionText() {
    return _bibleTrivia[_triviaQuestionNo].question;
  }

  bool getQuestionAnswer() {
    return _bibleTrivia[_triviaQuestionNo].answer;
  }

  String getQuestionChoice() {
    return _bibleTrivia[_triviaQuestionNo].choice;
  }

  bool completeQuize() {
    if (_triviaQuestionNo >= _bibleTrivia.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _triviaQuestionNo = 0;
  }

  int triviaScore() {
    return scoreKeeper.where((c) => c.icon == Icons.check).toList().length;
  }
}
