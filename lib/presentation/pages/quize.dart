import 'package:bible_trivia/application/theme/colors.dart';
import 'package:bible_trivia/presentation/model/quetion.dart';
import 'package:bible_trivia/presentation/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TriviaQuestion quiz = TriviaQuestion();

class Quizzler extends StatefulWidget {
  Quizzler({Key key}) : super(key: key);

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  int a;
  void checkAnswer(bool userAnswer) {
    ///get correct answer
    bool correctAnswer = quiz.getQuestionAnswer();

    if (quiz.completeQuize() == true) {
      scoreKeeper = [];
      showAlertDialog();
    } else {
      if (userAnswer == correctAnswer) {
        setState(() {
          correctAnswerWidget();
          quiz.nextQuestion();
          a = quiz.triviaScore();
          print(quiz.triviaScore());
        });
      } else {
        setState(() {
          wrongAnswerWidget();
          quiz.nextQuestion();
          a = quiz.triviaScore();
          print(quiz.triviaScore());
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: navyBlue,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: britishRacingGreen,
          title: Text(
            'Bible Trivia',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      textWidget(
                        displayText: quiz.getQuestionNo(),
                        color: white,
                      ),
                      textWidget(
                        displayText: quiz.getQuestionText(),
                        color: white,
                      ),
                      textWidget(
                        displayText: quiz.getQuestionChoice(),
                        color: white,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              checkAnswer(true);
                            },
                            child: Text(
                              "True",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: green,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextButton(
                            onPressed: () {
                              checkAnswer(false);
                            },
                            child: Text(
                              'False',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: red,
                            ),
                          ),
                        ),
                      ),
                      Row(children: scoreKeeper)
                    ]))));
  }

  showAlertDialog() {
    Alert(
      context: context,
      type: AlertType.success,
      title: 'Level 1 Complete',
      desc: 'Your score is $a',
      buttons: [
        DialogButton(
          child: Text(
            'Re-Try',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            quiz.reset();
          },
          width: 120,
        ),
        DialogButton(
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            quiz.reset();
            Navigator.pop(context);
          },
          width: 120,
        ),
      ],
    ).show();
  }
}
