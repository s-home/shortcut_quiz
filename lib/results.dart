import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResultsPage extends StatelessWidget {
  // 遷移前の入力値保持用
  List score = [];
  List text = [];
  int correctNumber = 0;
  int totalNumber = 0;
  double doublePoints = 0.0;
  int points = 0;

  ResultsPage(
      List resultText, List resultScore, int trueCount, int questionLength) {
    score = resultScore;
    text = resultText;
    correctNumber = trueCount;
    totalNumber = questionLength;
    print(totalNumber);
    print(correctNumber);
    double x = correctNumber.toDouble();
    double y = totalNumber.toDouble();

    doublePoints = x / y * 100;
    points = doublePoints.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Result',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Text('$points点'),
          Expanded(
            child: ListView.builder(
              itemCount: score.length,
              itemBuilder: (context, int index) {
                return Row(
                  children: <Widget>[
                    score[index],
                    text[index],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
