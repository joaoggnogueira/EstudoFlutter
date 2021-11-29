import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/components/index_counter.dart';
import 'package:trivia/components/points_counter.dart';
import 'package:trivia/components/question_button.dart';
import 'package:trivia/components/question_dialog.dart';
import 'package:trivia/components/question_text.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/models/score.dart';
import 'package:trivia/screens/scores.dart';

class MyHomePage extends StatefulWidget {
  final List<Question> questions;
  const MyHomePage({Key? key, required this.questions}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  int _points = 0;
  final List<Score> _scores = [];

  void showScores(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Scores(scores: _scores)));
  }

  void responder(String answer, BuildContext context) {
    setState(() {
      int accpoints = 0;
      Question question = widget.questions[_current];
      bool goal = question.checkResposta(answer);
      if (goal) {
        _points += question.points;
        accpoints = question.points;
      }
      Score score = Score(goal: goal, question: question);
      _scores.add(score);

      showGeneralDialog(
          context: context,
          transitionDuration: const Duration(milliseconds: 200),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.translate(
              offset: Offset(0, (1 - a1.value) * -200),
              child: Opacity(
                opacity: a1.value,
                child: QuestionDialog(points: accpoints),
              ),
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return QuestionDialog(points: accpoints);
          });
      _current++;
      _current = _current % widget.questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizedBox bottomNavigationBar = SizedBox(
        height: 58,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: const Color.fromRGBO(165, 145, 255, 1),
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.coffee), label: ("Pergunta do dia")),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories), label: ("Explorar")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ("Mais opções")),
          ],
        ));
    AppBar appBar = AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarOpacity: 0,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 4, 25, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IndexCounter(points: _scores.length),
                  PointsCounter(
                      points: _points,
                      onPressed: () {
                        showScores(context);
                      })
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(0)));

    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: OrientationBuilder(
        builder: (context, orientation) {
          List<Iterable<int>> columns = [];
          Iterable<int> keys = widget.questions[_current].options.asMap().keys;
          bool isPortrait = orientation == Orientation.portrait;
          if (isPortrait) {
            columns.add(keys.take(4));
          } else {
            columns.add(keys.take(2));
            columns.add(keys.skip(2));
          }
          return DecoratedBox(
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
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            58 -
                            33),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QuestionText(
                            text: widget.questions[_current].question,
                            orientation: orientation),
                        Row(
                            children: columns
                                .asMap()
                                .values
                                .map<Widget>((column) => Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4.0, 0, 4.0, 0),
                                        child: Column(
                                            children: column
                                                .map<Widget>((index) => Center(
                                                      child: QuestionButton(
                                                          text: widget
                                                              .questions[
                                                                  _current]
                                                              .options[index],
                                                          action: responder,
                                                          index: index),
                                                    ))
                                                .toList()),
                                      ),
                                    ))
                                .toList())
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
