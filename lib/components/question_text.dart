import 'dart:ui';

import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String text;
  final Orientation orientation;
  const QuestionText({Key? key, required this.text, required this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPortrait ? 300 : 150,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16 * MediaQuery.of(context).textScaleFactor,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
