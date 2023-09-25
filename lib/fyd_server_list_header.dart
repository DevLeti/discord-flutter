import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FYDServerListHeader extends StatelessWidget {
  FYDServerListHeader({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Background' (shape)
        Container(
          color: const Color(0xffffffff),
        ),
        Pinned.fromPins(
          Pin(size: 24.0, end: 21.0),
          Pin(size: 24.0, middle: 0.4516),
          child:
              // Adobe XD layer: 'Search Icon' (shape)
              SvgPicture.string(
            _svg_uzxn9d,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: SizedBox(
            width: 134.0,
            height: 33.0,
            child: Text(
              'Server List',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 27,
                color: const Color(0xff5965f2),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}

const String _svg_uzxn9d =
    '<svg viewBox="345.0 14.0 24.0 24.0" ><path transform="translate(343.0, 12.0)" d="M 10.39999866485596 2 C 5.775022506713867 2 2 5.775022506713867 2 10.39999866485596 C 2 15.02497673034668 5.775022506713867 18.80000305175781 10.39999866485596 18.80000305175781 C 12.49759769439697 18.80000305175781 14.41400909423828 18.01762962341309 15.88906192779541 16.73750114440918 L 16.39999961853027 17.24843788146973 L 16.39999961853027 18.80000305175781 L 23.60000228881836 26 L 26 23.60000228881836 L 18.80000305175781 16.39999961853027 L 17.24843788146973 16.39999961853027 L 16.73750114440918 15.88906192779541 C 18.01762962341309 14.41400909423828 18.80000305175781 12.49759769439697 18.80000305175781 10.39999866485596 C 18.80000305175781 5.775022506713867 15.02497673034668 2 10.39999866485596 2 Z M 10.39999866485596 4.400000095367432 C 13.72792148590088 4.400000095367432 16.39999961853027 7.072078704833984 16.39999961853027 10.39999866485596 C 16.39999961853027 13.72792148590088 13.72792148590088 16.39999961853027 10.39999866485596 16.39999961853027 C 7.072078704833984 16.39999961853027 4.400000095367432 13.72792148590088 4.400000095367432 10.39999866485596 C 4.400000095367432 7.072078704833984 7.072078704833984 4.400000095367432 10.39999866485596 4.400000095367432 Z" fill="#5865f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
