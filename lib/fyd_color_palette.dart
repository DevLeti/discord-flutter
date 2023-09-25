import 'package:flutter/material.dart';

class FYDColorPalette extends StatelessWidget {
  FYDColorPalette({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(''),
                fit: BoxFit.fill,
              ),
            ),
            margin: EdgeInsets.fromLTRB(-2.0, 0.0, 0.0, 0.0),
          ),
        ],
      ),
    );
  }
}
