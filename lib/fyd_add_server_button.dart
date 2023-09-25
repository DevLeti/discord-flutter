import 'package:flutter/material.dart';

class FYDAddServerButton extends StatelessWidget {
  FYDAddServerButton({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Rectangle' (shape)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff5965f2),
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0.0, 0.059),
          child: SizedBox(
            width: 140.0,
            height: 33.0,
            child:
                // Adobe XD layer: 'Server Title' (text)
                Text(
              'Add Server',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 27,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
              ),
              softWrap: false,
            ),
          ),
        ),
      ],
    );
  }
}
