import 'package:flutter/material.dart';
import 'constants.dart';

class KeyboardButton extends StatelessWidget {
  KeyboardButton({@required this.symbol, this.tap});

  final String symbol;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      child: Text(
        '$symbol',
        style: kButtonTextStyle,
      ),
      color: Colors.black26.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
      onPressed: tap,
    );
  }
}

class CtrlButton extends StatelessWidget {
  CtrlButton({@required this.symbol, this.tap});

  final String symbol;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 3.0),
      child: Text(
        '$symbol',
        style: kCtrlButtonTextStyle,
      ),
      color: Colors.black26.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
      onPressed: tap,
    );
  }
}

class ShiftButton extends StatelessWidget {
  ShiftButton({@required this.symbol, this.tap});

  final String symbol;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      child: Text(
        '$symbol',
        style: kShiftButtonTextStyle,
      ),
      color: Colors.black26.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
      onPressed: tap,
    );
  }
}

class JapaneseButton extends StatelessWidget {
  JapaneseButton({@required this.symbol, this.tap});

  final String symbol;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Text(
        '$symbol',
        style: kShiftButtonTextStyle,
      ),
      color: Colors.black26.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
      onPressed: tap,
    );
  }
}
