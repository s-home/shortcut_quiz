import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'keyboard.dart';
import 'constants.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int trueCount = 0;
  int n = quizBrain.getQuestionLength();

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
//Use IF/ELSE to check if we've reached the end of the quiz. If so,
//On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.

      if (userPickedAnswer == correctAnswer) {
//        scoreKeeper.add(Icon(
//          Icons.check,
//          color: Colors.green,
//        ));
        trueCount++;
      } else {
//        scoreKeeper.add(
//          Icon(
//            Icons.close,
//            color: Colors.red,
//          ),
//        );
      }

      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: '$n問中$trueCount問正解！',
        ).show();

        trueCount = 0;

        quizBrain.reset();

        scoreKeeper = [];
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 21,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
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
                child: KeyboardButton(
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
                child: KeyboardButton(
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
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
