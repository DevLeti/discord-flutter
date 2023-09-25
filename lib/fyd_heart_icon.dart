import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FYDHeartIcon extends StatelessWidget {
  FYDHeartIcon({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
            child:
                // Adobe XD layer: 'heart-icon' (shape)
                SvgPicture.string(
          _svg_jk7782,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        )),
      ],
    );
  }
}

const String _svg_jk7782 =
    '<svg viewBox="0.0 0.0 20.0 17.4" ><path transform="translate(-2.32, -4.5)" d="M 20.78087615966797 6.039448738098145 C 18.72559356689453 3.983200073242188 15.39229583740234 3.983200073242188 13.33701038360596 6.039449214935303 L 12.32280731201172 7.053651332855225 L 11.3086051940918 6.039448738098145 C 9.253039360046387 3.983881711959839 5.920306205749512 3.983881235122681 3.864739179611206 6.039448261260986 C 1.809171676635742 8.095013618469238 1.809172391891479 11.42774677276611 3.864739656448364 13.48331356048584 L 4.878942012786865 14.49751567840576 L 12.32280731201172 21.94137954711914 L 19.76667404174805 14.49751567840576 L 20.78087615966797 13.48331356048584 C 22.83712768554688 11.42803001403809 22.83712768554688 8.094732284545898 20.7808780670166 6.039448261260986 Z" fill="none" stroke="#000000" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" /></svg>';
