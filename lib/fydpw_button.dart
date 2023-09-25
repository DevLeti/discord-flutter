import 'package:flutter/material.dart';

class FYDPWButton extends StatelessWidget {
  FYDPWButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Rectangle' (shape)
        Container(
          width: 150.0,
          height: 50.0,
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
        Transform.translate(
          offset: Offset(26.0, 10.0),
          child:
              // Adobe XD layer: 'Register' (text)
              Text(
            'Register',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 25,
              color: const Color(0xff5865f2),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
