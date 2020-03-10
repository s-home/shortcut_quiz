import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'start_scene.dart';
import 'select_course.dart';

import 'memorization_page.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScene(),
      routes: <String, WidgetBuilder>{
        '/selectcourse': (BuildContext context) => SelectCourse(),
      },
    );
  }
}
