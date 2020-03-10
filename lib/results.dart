import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'select_course.dart';

class ResultsPage extends StatelessWidget {
  // 遷移前の入力値保持用
  List resultScore = [];
  List resultText = [];
  List resultAnswer = [];
  int trueCount = 0;
  int questionLength = 0;
  double doublePoints = 0.0;
  int points = 0;

  ResultsPage(List resultText, List resultScore, List resultAnswer,
      int trueCount, int questionLength) {
    this.resultScore = resultScore;
    this.resultText = resultText;
    this.resultAnswer = resultAnswer;
    this.trueCount = trueCount;
    this.questionLength = questionLength;
    double x = this.trueCount.toDouble();
    double y = this.questionLength.toDouble();

    doublePoints = x / y * 100;
    points = doublePoints.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.black26.withOpacity(0.3),
        title: Text(
          'Quiz Mode',
          style: TextStyle(
            fontFamily: 'BalooBhai',
            fontSize: 30.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: kAlertContainer,
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('いいえ'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: const Text('はい'),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectCourse()),
                              (_) => false);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('$points点'),
          Expanded(
            child: ListView.builder(
              itemCount: resultScore.length,
              itemBuilder: (context, int index) {
                return Container(
                  width: 100,
                  height: 80,
                  margin:
                      EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                  padding: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      title: resultText[index],
                      subtitle: resultAnswer[index],
                      trailing: resultScore[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
