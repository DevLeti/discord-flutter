import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class FYDIDForm extends StatelessWidget {
  FYDIDForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'ID' (text)
        SizedBox(
          width: 318.0,
          child: Text(
            'ID',
            style: TextStyle(
              fontFamily: 'Apple SD Gothic Neo',
              fontSize: 25,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 50.0, end: 0.0),
          child:
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
        ),
        Transform.translate(
          offset: Offset(20.0, 41.0),
          child:
              // Adobe XD layer: 'TextField' (text)
              SizedBox(
            width: 277.0,
            child: Text(
              'ID',
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
