import 'package:flutter/material.dart';

class FYDInitialPage extends StatelessWidget {
  FYDInitialPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(53.0, 289.0),
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
