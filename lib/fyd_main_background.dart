import 'package:flutter/material.dart';

class FYDMainBackground extends StatelessWidget {
  FYDMainBackground({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Main Page' (shape)
        Container(
          color: const Color(0xffffffff),
        ),
      ],
    );
  }
}
