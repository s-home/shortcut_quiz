import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'dart:math' as math;

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [];

  List<Question> _basicBank = [
    Question('コピー', 'C', false),
    Question('ペースト', 'V', false),
    Question('保存', 'S', false),
    Question('切り取り＆コピー', 'X', false),
    Question('全選択', 'A', false),
    Question('検索', 'F', false),
    Question('開いてるアプリを切り替える', 'tab', false),
    Question('範囲を指定してスクリーンショット', '5', true),
    Question('操作をひとつ取り消す', 'Z', false),
    Question('動作をひとつ取り消す', 'Z', true),
  ];

  List<Question> _browseBank = [
    Question('リロード(ページを再読み込み)する', 'R', false),
    Question('ブラウザで新しいタブを開く', 'T', false),
    Question('一つ前のページに戻る', '←', false),
    Question('タブを閉じる', 'W', false),
    Question('閉じたタブを再度開く', 'T', true),
    Question('ページの一番上に移動する', '↑', false),
    Question('サイト上部のリンクを選択する', 'L', false),
    Question('新規のウィンドウを開く', 'N', false),
    Question('新規のシークレットウィンドウを開く', 'N', true),
    Question('左隣のタブを表示する', '←' '左隣のタブを表示する', true),
    Question('ブックマークに追加する', 'D', false),
  ];

  void setQuestions(String course) {
    switch (course) {
      case 'basic':
        _questionBank = _basicBank;
        _questionBank.shuffle();
        break;
      case 'browse':
        _questionBank = _browseBank;
        _questionBank.shuffle();
        break;
    }
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int getRandomNumber() {
    return math.Random().nextInt(_questionBank.length);
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //A method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //A print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      return true;
    } else {
      return false;
    }
  }

  //A reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }

  int getQuestionLength() {
    return _questionBank.length;
  }

  bool checkShift() {
    return _questionBank[_questionNumber].containShift;
  }

  Widget shiftRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        '⌘',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 60.0,
        ),
      ),
      Text(
        '+',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 60.0,
        ),
      ),
      Text(
        'shift',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 40.0,
        ),
      ),
      Text(
        '+',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 60.0,
        ),
      ),
      SizedBox(
        width: 60.0,
        height: 60.0,
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Center(
            child: Text(
              '？',
              style: TextStyle(
                fontFamily: 'BalooBhai',
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      )
    ],
  );

  Widget nonShiftRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        '⌘',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 60.0,
        ),
      ),
      Text(
        '+',
        style: TextStyle(
          fontFamily: 'MPLUS',
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 60.0,
        ),
      ),
      SizedBox(
        width: 60.0,
        height: 60.0,
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Center(
            child: Text(
              '？',
              style: TextStyle(
                fontFamily: 'BalooBhai',
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
