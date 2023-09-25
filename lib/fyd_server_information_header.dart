import 'package:flutter/material.dart';
import './fyd_server_list_header.dart';
import 'package:adobe_xd/pinned.dart';
import './fyd_main.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FYDServerInformationHeader extends StatelessWidget {
  FYDServerInformationHeader({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Server List Header' (component)
        FYDServerListHeader(),
        Pinned.fromPins(
          Pin(size: 11.1, start: 21.0),
          Pin(size: 18.0, middle: 0.5),
          child:
              // Adobe XD layer: 'Icon material-navig…' (shape)
              PageLink(
            links: [
              PageLinkInfo(
                transition: LinkTransition.SlideRight,
                ease: Curves.easeOut,
                duration: 0.3,
                pageBuilder: () => FYDMain(),
              ),
            ],
            child: SvgPicture.string(
              _svg_yd4f5s,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}

const String _svg_yd4f5s =
    '<svg viewBox="21.0 18.5 11.1 18.0" ><path transform="translate(9.0, 9.5)" d="M 23.11499977111816 11.11499977111816 L 21 9 L 12 18 L 21 27 L 23.11499977111816 24.88500022888184 L 16.2450008392334 18 L 23.11499977111816 11.11499977111816 Z" fill="#5965f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
