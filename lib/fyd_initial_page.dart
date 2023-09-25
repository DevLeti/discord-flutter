import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class FYDInitialPage extends StatelessWidget {
  FYDInitialPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 53.0, end: 52.0),
            Pin(size: 267.0, middle: 0.5009),
            child: Text(
              'Fit\nYour\nDiscord',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 75,
                color: const Color(0xffffffff),
                letterSpacing: 1.5,
                fontWeight: FontWeight.w800,
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
