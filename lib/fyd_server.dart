import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FYDServer extends StatelessWidget {
  FYDServer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Element Background' (shape)
        Container(
          width: 365.0,
          height: 95.0,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(29.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(327.0, 38.5),
          child: SizedBox(
            width: 11.0,
            height: 18.0,
            child: SvgPicture.string(
              _svg_pmicgj,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(25.0, 25.0),
          child:
              // Adobe XD layer: 'Title' (text)
              SizedBox(
            width: 122.0,
            child: Text(
              '서버 타이틀',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 22,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(280.0, 39.0),
          child:
              // Adobe XD layer: 'Like Count' (text)
              SizedBox(
            width: 42.0,
            child: Text(
              '127',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 15,
                color: const Color(0x67000000),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(25.0, 53.0),
          child:
              // Adobe XD layer: 'Tag' (text)
              SizedBox(
            width: 266.0,
            child: Text(
              '#잡담 #게임 #스터디',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 15,
                color: const Color(0x67000000),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(266.0, 43.0),
          child: SizedBox(
            width: 11.0,
            height: 10.0,
            child: SvgPicture.string(
              _svg_jn915,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
      ],
    );
  }
}

const String _svg_pmicgj =
    '<svg viewBox="327.0 38.5 11.1 18.0" ><path transform="translate(314.11, 29.5)" d="M 15 9 L 12.88500022888184 11.11499977111816 L 19.7549991607666 18 L 12.88499927520752 24.88500022888184 L 15 27 L 24 18 L 15 9 Z" fill="#000000" fill-opacity="1.0" stroke="none" stroke-width="1" stroke-opacity="1.0" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jn915 =
    '<svg viewBox="266.0 43.0 11.0 9.6" ><path transform="translate(263.68, 38.5)" d="M 12.4748592376709 5.345464706420898 C 11.34445381164551 4.214527606964111 9.511140823364258 4.214527606964111 8.380735397338867 5.345464706420898 L 7.822922229766846 5.903275966644287 L 7.265110969543457 5.345464706420898 C 6.134549617767334 4.214902877807617 4.301547050476074 4.214902877807617 3.170985221862793 5.345464706420898 C 2.040423154830933 6.476025104522705 2.040423631668091 8.309028625488281 3.170985460281372 9.439591407775879 L 3.728796482086182 9.997402191162109 L 7.822922229766846 14.09152698516846 L 11.91704940795898 9.997402191162109 L 12.4748592376709 9.439591407775879 C 13.60579776763916 8.309184074401855 13.60579776763916 6.475870609283447 12.47486019134521 5.345464706420898 Z" fill="none" fill-opacity="0.4" stroke="#000000" stroke-width="2" stroke-opacity="0.4" stroke-linecap="round" stroke-linejoin="round" /></svg>';
