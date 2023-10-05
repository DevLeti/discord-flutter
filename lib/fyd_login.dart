import 'package:flutter/material.dart';
import './fydpw_button.dart';
import './fyd_login_button.dart';
import './fydpw_form.dart';
import 'package:adobe_xd/pinned.dart';
import './fydid_form.dart';

class FYDLogin extends StatelessWidget {
  FYDLogin({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(39.0, 521.0),
            child: SizedBox(
              width: 150.0,
              height: 50.0,
              child:
                  // Adobe XD layer: 'PW Button' (component)
                  FYDPWButton(),
            ),
          ),
          Transform.translate(
            offset: Offset(201.0, 521.0),
            child: SizedBox(
              width: 150.0,
              height: 50.0,
              child:
                  // Adobe XD layer: 'Login Button' (component)
                  FYDLoginButton(),
            ),
          ),
          Transform.translate(
            offset: Offset(36.0, 411.0),
            child: SizedBox(
              width: 318.0,
              height: 81.0,
              child:
                  // Adobe XD layer: 'PW Form' (component)
                  FYDPWForm(),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 36.0),
            Pin(size: 81.0, middle: 0.4128),
            child:
                // Adobe XD layer: 'ID Form' (component)
                FYDIDForm(),
          ),
          Transform.translate(
            offset: Offset(105.0, 216.0),
            child:
                // Adobe XD layer: 'Login Title' (text)
                Text(
              'Login',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 70,
                color: const Color(0xffffffff),
                letterSpacing: 0.7000000000000001,
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
