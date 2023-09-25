import 'package:flutter/material.dart';
import './fyd_main_background.dart';
import './fyd_server.dart';
import './fyd_server_info.dart';
import 'package:adobe_xd/page_link.dart';
import './fyd_server_list_header.dart';

class FYDMain extends StatelessWidget {
  FYDMain({
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
            offset: Offset(13.0, 112.0),
            child: SizedBox(
              width: 365.0,
              height: 95.0,
              child:
                  // Adobe XD layer: 'Server' (component)
                  PageLink(
                links: [
                  PageLinkInfo(
                    transition: LinkTransition.SlideLeft,
                    ease: Curves.easeOut,
                    duration: 0.3,
                    pageBuilder: () => FYDServerInfo(),
                  ),
                ],
                child: FYDServer(),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 53.0),
            child: SizedBox(
              width: 390.0,
              height: 55.0,
              child:
                  // Adobe XD layer: 'Server List Header' (component)
                  FYDServerListHeader(),
            ),
          ),
        ],
      ),
    );
  }
}
