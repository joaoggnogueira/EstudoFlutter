import 'dart:ui';

import 'package:flutter/material.dart';

class QuestionDialog extends StatelessWidget {
  final int points;

  const QuestionDialog({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String message = (points > 0 ? "Acertou!" : "Errou");
    final Color color = (points > 0 ? Colors.green : Colors.red);
    contentBox(context) {
      return Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 200,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(message,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30 *
                                          MediaQuery.of(context)
                                              .textScaleFactor)),
                              Text('+$points pontos',
                                  style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15 *
                                          MediaQuery.of(context)
                                              .textScaleFactor))
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          child: Text("continuar",
                              style: TextStyle(
                                  fontSize: 16 *
                                      MediaQuery.of(context).textScaleFactor)),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ), // bottom part
          Positioned(
            left: 20,
            child: CircleAvatar(
                backgroundColor: color,
                radius: 50,
                child: Icon(
                  (points > 0 ? Icons.check : Icons.close),
                  color: Colors.white,
                  size: 40,
                )), // top part
          )
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
}
