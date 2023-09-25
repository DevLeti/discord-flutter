import 'package:flutter/material.dart';

class FYDLoginButton extends StatelessWidget {
  FYDLoginButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Rectangle' (shape)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Center(
          child: SizedBox(
            width: 66.0,
            height: 32.0,
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 27,
                color: const Color(0xff5865f2),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
