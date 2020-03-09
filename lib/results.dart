import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  // 遷移前の入力値保持用
  List score = [];
  List text = [];

  ResultsPage(List resultText, List resultScore) {
    score = resultScore;
    text = resultText;
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
      body: ListView.builder(
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
    );
  }
}
