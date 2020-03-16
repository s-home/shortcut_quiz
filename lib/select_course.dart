import 'package:flutter/material.dart';
import 'package:shortcut_quiz_app/select_mode.dart';
import 'constants.dart';

class SelectCourse extends StatelessWidget {
  String course = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26.withOpacity(0.3),
        title: Text(
          'Select Course',
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
              const Color(0xff80d8ff), //透明度
              const Color(0xffffe57f), //透明度
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
                    "- Basic -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    course = 'basic';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SelectMode(
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
                    "- Browse -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    course = 'browse';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SelectMode(
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
                    "- ??? -",
                    style: TextStyle(
                      fontFamily: 'BalooBhai',
                      fontSize: 30.0,
                      color: Colors.white30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white70),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
