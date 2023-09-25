import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_heart_icon.dart';

class FYDBody extends StatelessWidget {
  FYDBody({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Element Background' (shape)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(29.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 20.0, middle: 0.9304),
          Pin(size: 17.4, end: 42.3),
          child:
              // Adobe XD layer: 'heart-icon' (component)
              FYDHeartIcon(),
        ),
        Pinned.fromPins(
          Pin(start: 247.0, end: 52.0),
          Pin(size: 24.0, middle: 0.931),
          child:
              // Adobe XD layer: 'Server Description' (text)
              Text(
            '126',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 20,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 18.0, end: 19.0),
          Pin(size: 288.0, middle: 0.3887),
          child:
              // Adobe XD layer: 'Server Description' (text)
              Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 20,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 122.0, middle: 0.4979),
          Pin(size: 32.0, start: 16.0),
          child:
              // Adobe XD layer: 'Description Title' (text)
              Text(
            '서버 타이틀',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 25,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Pinned.fromPins(
          Pin(start: 49.0, end: 50.0),
          Pin(size: 21.0, start: 48.0),
          child:
              // Adobe XD layer: 'Server Tag' (text)
              Text(
            '#잡담 #게임 #스터디',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 17,
              color: const Color(0x67000000),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 122.0, start: 18.0),
          Pin(size: 25.0, start: 92.0),
          child:
              // Adobe XD layer: 'Server Title' (text)
              Text(
            '서버 설명',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 20,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
