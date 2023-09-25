import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_login_button.dart';
import './fydid_component.dart';

class FYDLogin extends StatelessWidget {
  FYDLogin({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 150.0, start: 39.0),
            Pin(size: 50.0, middle: 0.6562),
            child:
                // Adobe XD layer: 'Register Button' (component)
                FYDLoginButton(),
          ),
          Pinned.fromPins(
            Pin(size: 150.0, end: 39.0),
            Pin(size: 50.0, middle: 0.6562),
            child:
                // Adobe XD layer: 'Login Button' (component)
                FYDLoginButton(),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 36.0),
            Pin(size: 80.0, middle: 0.538),
            child:
                // Adobe XD layer: 'PW Component' (component)
                FYDIDComponent(),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 36.0),
            Pin(size: 81.0, middle: 0.4128),
            child:
                // Adobe XD layer: 'ID Component' (component)
                FYDIDComponent(),
          ),
          Align(
            alignment: Alignment(0.0, -0.428),
            child: SizedBox(
              width: 192.0,
              height: 89.0,
              child:
                  // Adobe XD layer: 'Login Title' (text)
                  Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 75,
                  color: const Color(0xffffffff),
                  letterSpacing: 0.75,
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
