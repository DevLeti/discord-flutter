import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_heart_icon.dart';

class FYDBody extends StatelessWidget {
  FYDBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Element Background' (shape)
        Container(
          width: 365.0,
          height: 589.0,
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
        Transform.translate(
          offset: Offset(247.0, 526.0),
          child:
              // Adobe XD layer: 'Server Description' (text)
              SizedBox(
            width: 66.0,
            child: Text(
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
        ),
        Transform.translate(
          offset: Offset(18.0, 117.0),
          child:
              // Adobe XD layer: 'Server Description' (text)
              SizedBox(
            width: 328.0,
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(121.0, 16.0),
          child:
              // Adobe XD layer: 'Description Title' (text)
              SizedBox(
            width: 122.0,
            child: Text(
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
        ),
        Transform.translate(
          offset: Offset(49.0, 48.0),
          child:
              // Adobe XD layer: 'Server Tag' (text)
              SizedBox(
            width: 266.0,
            child: Text(
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
        ),
        Transform.translate(
          offset: Offset(18.0, 92.0),
          child:
              // Adobe XD layer: 'Server Title' (text)
              SizedBox(
            width: 122.0,
            child: Text(
              '서버 설명',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 20,
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
