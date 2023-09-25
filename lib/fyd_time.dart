import 'package:flutter/material.dart';

class FYDTime extends StatelessWidget {
  FYDTime({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Time - Light' (group)
        Stack(
          children: <Widget>[
            // Adobe XD layer: 'Time - Light backgr…' (shape)
            Container(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              child: SizedBox.expand(
                  child:
                      // Adobe XD layer: 'Time' (text)
                      Text(
                '9:41',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 16,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              )),
            ),
          ],
        ),
      ],
    );
  }
}
