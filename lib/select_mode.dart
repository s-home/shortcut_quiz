import 'package:flutter/material.dart';
import 'package:shortcut_quiz_app/memorization_page.dart';
import 'quiz_scene.dart';
import 'memorization_page.dart';
import 'constants.dart';

class SelectMode extends StatelessWidget {
  String course = '';
  SelectMode(String course) {
    this.course = course;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(106, 90, 203, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black26.withOpacity(0.3),
        title: Text(
          'select mode',
          style: TextStyle(
            fontFamily: 'BalooBhai',
            fontSize: 30.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.black45, width: 10.0),
          //borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: [
              const Color(0xffffff00).withOpacity(0.9), //透明度
              const Color(0xfff50057).withOpacity(0.7), //透明度
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 250.0,
                height: 100.0,
                child: RaisedButton(
                  child: Text(
                    "- memorization -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Memorization(
                          this.course,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ButtonTheme(
                minWidth: 250.0,
                height: 100.0,
                child: RaisedButton(
                  child: Text(
                    "- Quiz -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => QuizScene(
                          this.course,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
