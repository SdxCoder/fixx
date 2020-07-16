
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core.dart';

class Counter extends StatefulWidget {
  final ValueChanged<int> onChange;
  final int initialValue;

  const Counter({Key key, this.onChange, this.initialValue = 0}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
       width: 110,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 0.5,
            color: HexColor('d3d3d3'),
          )),
      child: Row(
        children: [
        IconButton(
            padding: EdgeInsets.zero,
            iconSize: 10,
            icon: Icon(FontAwesomeIcons.minus,
                size: 10, color: Theme.of(context).primaryColor),
            onPressed: () {
              _handleDecrement();
            }),
        Text(
          '$_counter',
          style: Theme.of(context).accentTextTheme.caption.copyWith(
            color: Theme.of(context).primaryColor
          ),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            iconSize: 10,
            icon: Icon(
              FontAwesomeIcons.plus,
              size: 10,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              _handleIncrement();
            }),
      ]),
    );
  }

  void _handleIncrement() {
    if (_counter < 10) {
      setState(() {
        _counter++;
        widget.onChange(_counter);
      });
    }
  }

  void _handleDecrement() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        widget.onChange(_counter);
      });
    }
  }
}
