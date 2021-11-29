// ignore_for_file: file_names

class Question {
  final String question;
  final List<String> options;
  final int resposta;
  final int points;

  Question(
      {required this.resposta,
      required this.options,
      required this.question,
      required this.points});

  bool checkResposta(String test) {
    return test == options[resposta];
  }
}
