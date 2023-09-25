import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_main_background.dart';
import './fyd_add_server_button.dart';
import './fyd_body.dart';
import './fyd_server_information_header.dart';
import './fyd_bars_status_bar_i_phone.dart';

class FYDServerInfo extends StatelessWidget {
  FYDServerInfo({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 34.0, end: 0.0),
            child:
                // Adobe XD layer: 'Under Notch' (shape)
                Container(
              decoration: BoxDecoration(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 53.0, 0.0, 34.0),
            child:
                // Adobe XD layer: 'Main Background' (component)
                FYDMainBackground(),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 36.0),
            Pin(size: 50.0, end: 57.0),
            child:
                // Adobe XD layer: 'Add Server Button' (component)
                FYDAddServerButton(),
          ),
          Pinned.fromPins(
            Pin(start: 13.0, end: 12.0),
            Pin(size: 589.0, start: 112.0),
            child:
                // Adobe XD layer: 'Body' (component)
                FYDBody(),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 55.0, start: 47.0),
            child:
                // Adobe XD layer: 'Server Information …' (component)
                FYDServerInformationHeader(),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 53.0, start: 0.0),
            child:
                // Adobe XD layer: 'Status Bars - iPhon…' (component)
                FYDBarsStatusBarIPhone(),
          ),
        ],
      ),
    );
  }
}
