import 'package:flutter/material.dart';

class PointsCounter extends StatelessWidget {
  final int points;
  final Function? onPressed;
  const PointsCounter({Key? key, required this.points, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Center(
            child: Text(
              points.toString(),
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12 * MediaQuery.of(context).textScaleFactor,
                  fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
