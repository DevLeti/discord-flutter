import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fydok_button.dart';

class FYDLoginFail extends StatelessWidget {
  FYDLoginFail({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'Background' (shape)
          Container(
            decoration: BoxDecoration(
              color: const Color(0xfffee75c),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            margin: EdgeInsets.all(10.0),
          ),
          Align(
            alignment: Alignment(0.0, -0.366),
            child: SizedBox(
              width: 224.0,
              height: 34.0,
              child:
                  // Adobe XD layer: 'Title' (text)
                  Text(
                'Failed to proceed',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 28,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 23.0, end: 23.0),
            Pin(size: 24.0, middle: 0.5),
            child: Text(
              'Check your input and try again',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 20,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w500,
              ),
              softWrap: false,
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.461),
            child: SizedBox(
              width: 150.0,
              height: 50.0,
              child:
                  // Adobe XD layer: 'OK Button' (component)
                  FYDOKButton(),
            ),
          ),
        ],
      ),
    );
  }
}
