import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_main_background.dart';
import './fyd_server.dart';
import './fyd_server_info.dart';
import 'package:adobe_xd/page_link.dart';
import './fyd_server_list_header.dart';
import './fyd_bars_status_bar_i_phone.dart';

class FYDMain extends StatelessWidget {
  FYDMain({
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
            Pin(start: 13.0, end: 12.0),
            Pin(size: 95.0, middle: 0.6222),
            child:
                // Adobe XD layer: 'Server 4' (component)
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
          Pinned.fromPins(
            Pin(start: 13.0, end: 12.0),
            Pin(size: 95.0, middle: 0.4646),
            child:
                // Adobe XD layer: 'Server 3' (component)
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
          Pinned.fromPins(
            Pin(start: 13.0, end: 12.0),
            Pin(size: 95.0, middle: 0.3071),
            child:
                // Adobe XD layer: 'Server 2' (component)
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
          Pinned.fromPins(
            Pin(start: 13.0, end: 12.0),
            Pin(size: 95.0, start: 112.0),
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
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 55.0, start: 53.0),
            child:
                // Adobe XD layer: 'Server List Header' (component)
                FYDServerListHeader(),
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 53.0, start: 0.0),
            child:
                // Adobe XD layer: 'Bars - Status Bar -…' (component)
                FYDBarsStatusBarIPhone(),
          ),
        ],
      ),
    );
  }
}
