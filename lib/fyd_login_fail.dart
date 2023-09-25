import 'package:flutter/material.dart';
import './fydok_button.dart';

class FYDLoginFail extends StatelessWidget {
  FYDLoginFail({
    Key? key,
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
          Transform.translate(
            offset: Offset(48.0, 78.0),
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
          Transform.translate(
            offset: Offset(23.0, 128.0),
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
          Transform.translate(
            offset: Offset(85.0, 168.0),
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
