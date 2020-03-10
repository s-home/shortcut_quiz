import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'select_course.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

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
      backgroundColor: Color(0xff212121),
      appBar: GradientAppBar(
        backgroundColorStart: const Color(0xffe4a972),
        backgroundColorEnd: const Color(0xff9941d8),
        leading: Container(),
        //backgroundColor: Colors.black26.w0xff9941d8ithOpacity(0.3),
        title: Text(
          'Quiz Result',
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
                  return new AlertDialog(
                    content: kAlertContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: const Text('いいえ',
                            style: TextStyle(color: Colors.black45)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      new FlatButton(
                        child: const Text('はい',
                            style: TextStyle(color: Colors.black45)),
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
          SizedBox(
            height: 80.0,
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(),
          ),
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Color(0xffe4a972),
                  Color(0xff9941d8),
                ],
              ),
            ),
            child: Center(
              child: Text(
                '$points点',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'MPLUS',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultScore.length,
              itemBuilder: (context, int index) {
                return Container(
//                  height: 80,
                  margin:
                      EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
//                  padding: EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2),
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
