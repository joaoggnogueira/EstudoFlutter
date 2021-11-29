import 'package:flutter/material.dart';

class IndexCounter extends StatelessWidget {
  final int points;

  const IndexCounter({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${points + 1}° pergunta',
      style: TextStyle(
          color: Colors.white,
          fontSize: 16 * MediaQuery.of(context).textScaleFactor),
    );
  }
}
