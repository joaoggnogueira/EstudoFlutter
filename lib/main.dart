import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/screens/question.dart';

import 'models/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String question =
        "Lorem ipsum dolor sit amet. Ut ratione accusamus sed minima vero et doloribus dolor ea obcaecati ducimus eum quia dolores et minus molestiae est harum dolorum. Ea mollitia accusantium et cumque nulla qui optio voluptas aut consequuntur nisi est saepe commodi aut necessitatibus nesciunt et velit ducimus.";
    final List<String> options = [
      "Option A",
      "Option B",
      "Option C",
      "Option D"
    ];

    final List<Question> questions = [
      Question(question: question, options: options, resposta: 0, points: 10),
      Question(
          question: "Pergunta 2", options: options, resposta: 1, points: 12),
      Question(
          question: "Pergunta 3", options: options, resposta: 2, points: 15),
      Question(
          question: "Pergunta 4", options: options, resposta: 3, points: 16),
      Question(
          question: "Pergunta 5", options: options, resposta: 0, points: 20)
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "GreyCliff",
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color.fromRGBO(50, 56, 196, 1)),
      home: MyHomePage(questions: questions),
    );
  }
}
