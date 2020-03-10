import 'package:flutter/material.dart';
import 'package:shortcut_quiz_app/select_mode.dart';
import 'constants.dart';

class SelectCourse extends StatelessWidget {
  String course = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kGradientDecoration,
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
                    "- Finder -",
                    style: kRaisedButtonTextStyle,
                  ),
                  color: Colors.white.withOpacity(0.0),
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onPressed: () {
                    course = 'finder';
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
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
