import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trivia/models/score.dart';

class Scores extends StatefulWidget {
  final List<Score> scores;
  const Scores({Key? key, required this.scores}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        iconSize: 20 * MediaQuery.of(context).textScaleFactor,
                        icon: const Icon(Icons.chevron_left)),
                    Text(
                      'Scores',
                      style: TextStyle(
                          fontSize:
                              14 * MediaQuery.of(context).textScaleFactor),
                    ),
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(0)),
          backgroundColor: Theme.of(context).primaryColor,
          toolbarOpacity: 0,
          centerTitle: true,
        ),
        body: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(113, 116, 209, 1),
                  Color.fromRGBO(50, 56, 196, 1)
                ],
                stops: [0.201, 1],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              image: DecorationImage(
                image: AssetImage("background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 25),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                    children:
                        widget.scores.asMap().keys.map<Widget>((originalIndex) {
                      int index = widget.scores.length - originalIndex - 1;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 12, 40, 12),
                        child: Wrap(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Pergunta ${index + 1}.',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12 *
                                        MediaQuery.of(context).textScaleFactor,
                                    fontWeight: FontWeight.w700)),
                          ),
                          widget.scores[index].goal
                              ? Text(
                                  'Acertou +${widget.scores[index].question.points}',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      fontWeight: FontWeight.w700))
                              : Text('Errou',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      fontWeight: FontWeight.w700)),
                        ]),
                      );
                    }).toList(),
                  ),
                ))));
  }
}
