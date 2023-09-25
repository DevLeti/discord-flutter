import 'package:flutter/material.dart';

class FYDOKButton extends StatelessWidget {
  FYDOKButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Background' (shape)
        Container(
          width: 150.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
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
          offset: Offset(56.0, 9.0),
          child:
              // Adobe XD layer: 'OK' (text)
              Text(
            'OK',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 27,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
