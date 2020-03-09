import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'keyboard.dart';
import 'constants.dart';
import 'results.dart';
import 'package:flutter/animation.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text(
            'Quiz Mode',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
//  AnimationController _controller;
//  Animation<double> _animation;
//
//  initState() {
//    super.initState();
//    _controller = AnimationController(
//        duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
//    _animation =
//        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
//
//    _controller.forward();
//  }
//
//  dispose() {
//    _controller.dispose();
//    super.dispose();
//  }

  int trueCount = 0;
  int questionLength = quizBrain.getQuestionLength();
  int currentQuestion = 1;
  String currentQuestionText = quizBrain.getQuestionText();
  List<Widget> resultText = [];
  List<Icon> resultScore = [];

//  bool isChecking = false;
//
//  double itemSize = 100.0;
//
//  Widget popUp() {
//    return Container(
//      child: ScaleTransition(
//        scale: _animation,
//        alignment: Alignment.center,
//        child: Icon(
//          Icons.trip_origin,
//          size: itemSize,
//          color: Colors.red,
//        ),
//      ),
//    );
//  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
//Use IF/ELSE to check if we've reached the end of the quiz. If so,
//On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.

      if (userPickedAnswer == correctAnswer) {
        resultText.add(
          Text(
            '$currentQuestionText',
          ),
        );
        resultScore.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        trueCount++;
        Alert(
          context: context,
          title: "正解！",
          buttons: [
            DialogButton(
              child: Text(
                "次の問題へ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ).show();
      } else {
        resultText.add(
          Text(
            '$currentQuestionText',
          ),
        );
        resultScore.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        Alert(
          context: context,
          type: AlertType.error,
          title: "残念！",
          buttons: [
            DialogButton(
              child: Text(
                "次の問題へ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ).show();
      }

      if (quizBrain.isFinished() == true) {
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) =>
                ResultsPage(resultText, resultScore, trueCount, questionLength),
          ),
        );

        Alert(
          context: context,
          title: 'Finished!',
          desc: '$questionLength問中$trueCount問正解！',
        ).show();

        currentQuestion = 0;

        quizBrain.reset();
      } else {
        currentQuestion++;
        quizBrain.nextQuestion();
        currentQuestionText = quizBrain.getQuestionText();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 16,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
//                    width: 80.0,
//                    child: (isChecking ? popUp() : Container()),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '⌘',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 60.0,
                          ),
                        ),
                        Text(
                          '+',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 60.0,
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '？',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '1',
                  tap: () {
                    checkAnswer('1');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '2',
                  tap: () {
                    checkAnswer('2');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '3',
                  tap: () {
                    checkAnswer('3');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '4',
                  tap: () {
                    checkAnswer('4');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '5',
                  tap: () {
                    checkAnswer('5');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '6',
                  tap: () {
                    checkAnswer('6');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '7',
                  tap: () {
                    checkAnswer('7');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '8',
                  tap: () {
                    checkAnswer('8');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '9',
                  tap: () {
                    checkAnswer('9');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '0',
                  tap: () {
                    checkAnswer('0');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '-',
                  tap: () {
                    checkAnswer('-');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '^',
                  tap: () {
                    checkAnswer('^');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '¥',
                  tap: () {
                    checkAnswer('¥');
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: CtrlButton(
                  symbol: 'tab',
                  tap: () {
                    checkAnswer('tab');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'Q',
                  tap: () {
                    checkAnswer('Q');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'W',
                  tap: () {
                    checkAnswer('W');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'E',
                  tap: () {
                    checkAnswer('E');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'R',
                  tap: () {
                    checkAnswer('R');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'T',
                  tap: () {
                    checkAnswer('T');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'Y',
                  tap: () {
                    checkAnswer('Y');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'U',
                  tap: () {
                    checkAnswer('U');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'I',
                  tap: () {
                    checkAnswer('I');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'O',
                  tap: () {
                    checkAnswer('O');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'P',
                  tap: () {
                    checkAnswer('P');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '@',
                  tap: () {
                    checkAnswer('@');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '[',
                  tap: () {
                    checkAnswer('[');
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: CtrlButton(
                  symbol: 'ctrl',
                  tap: () {
                    checkAnswer('ctrl');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'A',
                  tap: () {
                    checkAnswer('A');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'S',
                  tap: () {
                    checkAnswer('S');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'D',
                  tap: () {
                    checkAnswer('D');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'F',
                  tap: () {
                    checkAnswer('F');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'G',
                  tap: () {
                    checkAnswer('G');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'H',
                  tap: () {
                    checkAnswer('H');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'J',
                  tap: () {
                    checkAnswer('J');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'K',
                  tap: () {
                    checkAnswer('K');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'L',
                  tap: () {
                    checkAnswer('L');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: ';',
                  tap: () {
                    checkAnswer(';');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: ':',
                  tap: () {
                    checkAnswer(':');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: ']',
                  tap: () {
                    checkAnswer(']');
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'Z',
                  tap: () {
                    checkAnswer('Z');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'X',
                  tap: () {
                    checkAnswer('X');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'C',
                  tap: () {
                    checkAnswer('C');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'V',
                  tap: () {
                    checkAnswer('V');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'B',
                  tap: () {
                    checkAnswer('B');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'N',
                  tap: () {
                    checkAnswer('N');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'M',
                  tap: () {
                    checkAnswer('M');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: ',',
                  tap: () {
                    checkAnswer(',');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '.',
                  tap: () {
                    checkAnswer('.');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '/',
                  tap: () {
                    checkAnswer('/');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '_',
                  tap: () {
                    checkAnswer('_');
                  },
                ),
              ),
              SizedBox(
                width: 58.0,
                height: kSizedBoxHeight,
                child: ShiftButton(
                  symbol: 'shift',
                  tap: () {
                    checkAnswer('shift');
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: kSizedBoxWidth,
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: CtrlButton(
                  symbol: 'opt',
                  tap: () {
                    checkAnswer('opt');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '⌘',
                  tap: () {
                    checkAnswer('⌘');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: CtrlButton(
                  symbol: '英',
                  tap: () {
                    checkAnswer('英');
                  },
                ),
              ),
              SizedBox(
                width: 87.0,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'space',
                  tap: () {
                    checkAnswer('space');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: CtrlButton(
                  symbol: '日',
                  tap: () {
                    checkAnswer('日');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: 'fn',
                  tap: () {
                    checkAnswer('fn');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '←',
                  tap: () {
                    checkAnswer('←');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '↑',
                  tap: () {
                    checkAnswer('↑');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
                height: kSizedBoxHeight,
                child: KeyboardButton(
                  symbol: '→',
                  tap: () {
                    checkAnswer('→');
                  },
                ),
              ),
              SizedBox(
                width: kSizedBoxWidth,
              ),
            ],
          ),
        ),
        Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.red,
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.edit,
                size: 50.0,
                color: Colors.white,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '$currentQuestion/$questionLength',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 70.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
