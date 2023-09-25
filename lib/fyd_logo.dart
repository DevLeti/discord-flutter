import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FYDLogo extends StatelessWidget {
  FYDLogo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5865f2),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.481, -0.438),
            child:
                // Adobe XD layer: 'Discord Logo' (shape)
                Container(
              width: 388.0,
              height: 294.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox.expand(
              child:
                  // Adobe XD layer: 'Search Icon' (shape)
                  SvgPicture.string(
            _svg_ief406,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          )),
        ],
      ),
    );
  }
}

const String _svg_ief406 =
    '<svg viewBox="0.0 0.0 1024.0 1024.0" ><path transform="translate(-2.0, -2.0)" d="M 360.4000244140625 2 C 163.067626953125 2 2 163.067626953125 2 360.4000244140625 C 2 557.732421875 163.067626953125 718.7999877929688 360.4000244140625 718.7999877929688 C 449.8975524902344 718.7999877929688 531.6644287109375 685.4188232421875 594.5999755859375 630.7999877929688 L 616.3999633789062 652.5999755859375 L 616.3999633789062 718.7999877929688 L 923.5999755859375 1026 L 1026 923.5999755859375 L 718.7999877929688 616.3999633789062 L 652.5999755859375 616.3999633789062 L 630.7999877929688 594.5999755859375 C 685.4188232421875 531.6644287109375 718.7999877929688 449.8975524902344 718.7999877929688 360.4000244140625 C 718.7999877929688 163.067626953125 557.732421875 2 360.4000244140625 2 Z M 360.4000244140625 104.4000015258789 C 502.3913269042969 104.4000015258789 616.3999633789062 218.40869140625 616.3999633789062 360.4000244140625 C 616.3999633789062 502.3913269042969 502.3913269042969 616.3999633789062 360.4000244140625 616.3999633789062 C 218.40869140625 616.3999633789062 104.4000015258789 502.3913269042969 104.4000015258789 360.4000244140625 C 104.4000015258789 218.40869140625 218.40869140625 104.4000015258789 360.4000244140625 104.4000015258789 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
