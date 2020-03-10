import 'package:flutter/material.dart';

const kButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 18.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kCtrlButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 15.0,
  height: 1.1,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kShiftButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 15.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kSpaceButtonTextStyle = TextStyle(
  fontFamily: 'BalooBhai',
  fontSize: 15.0,
  height: 1.5,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const kSizedBoxWidth = 28.0;
const kSizedBoxHeight = 28.0;

final kStartTextStyle = TextStyle(
  color: Colors.white.withOpacity(0.8),
  fontWeight: FontWeight.w600,
  fontSize: 60.0,
);

final kGradientDecoration = BoxDecoration(
  border: Border.all(color: Colors.black45, width: 10.0),
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    colors: [
      const Color(0xffE040FB), //透明度
      const Color(0xff42A5F5), //透明度
    ],
  ),
);

const kRaisedButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

final kAlertContainer = Container(
  height: 70.0,
  padding: EdgeInsets.only(top: 20.0),
  child: Column(
    children: <Widget>[
      Text('コース選択へ戻ります'),
      Text('よろしいですか？'),
    ],
  ),
);
