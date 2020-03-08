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
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(1.0),
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
      padding: EdgeInsets.all(0.0),
      child: Text(
        '$symbol',
        style: kCtrlButtonTextStyle,
      ),
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(1.0),
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
      color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(1.0),
      ),
      onPressed: tap,
    );
  }
}
