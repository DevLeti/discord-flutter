import 'package:flutter/material.dart';

class FYDPWComponent extends StatelessWidget {
  FYDPWComponent({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'PW' (text)
        SizedBox(
          width: 318.0,
          child: Text(
            'PW',
            style: TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 25,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0.0, 31.0),
          child:
              // Adobe XD layer: 'Rectangle' (shape)
              Container(
            width: 318.0,
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
        ),
        Transform.translate(
          offset: Offset(20.0, 41.0),
          child:
              // Adobe XD layer: 'TextField' (text)
              SizedBox(
            width: 277.0,
            child: Text(
              'PW',
              style: TextStyle(
                fontFamily: 'Apple SD Gothic Neo',
                fontSize: 25,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
