import 'package:flutter/material.dart';
import './fyd_main_background.dart';
import './fyd_add_server_button.dart';
import './fyd_body.dart';
import './fyd_server_information_header.dart';

class FYDServerInfo extends StatelessWidget {
  FYDServerInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 53.0, 0.0, 34.0),
            child:
                // Adobe XD layer: 'Main Background' (component)
                FYDMainBackground(),
          ),
          Transform.translate(
            offset: Offset(36.0, 737.0),
            child: SizedBox(
              width: 318.0,
              height: 50.0,
              child:
                  // Adobe XD layer: 'Add Server Button' (component)
                  FYDAddServerButton(),
            ),
          ),
          Transform.translate(
            offset: Offset(13.0, 112.0),
            child: SizedBox(
              width: 365.0,
              height: 589.0,
              child:
                  // Adobe XD layer: 'Body' (component)
                  FYDBody(),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 47.0),
            child: SizedBox(
              width: 390.0,
              height: 55.0,
              child:
                  // Adobe XD layer: 'Server Information …' (component)
                  FYDServerInformationHeader(),
            ),
          ),
        ],
      ),
    );
  }
}
