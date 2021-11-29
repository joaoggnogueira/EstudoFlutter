import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String text;
  final Function action;
  final int index;
  static const List<String> letters = ['a', 'b', 'c', 'd'];

  const QuestionButton(
      {Key? key, required this.text, required this.action, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: const EdgeInsets.all(4),
            shape: const StadiumBorder(),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: const Color.fromRGBO(113, 116, 209, 1),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                        child: Text(letters[index],
                            style: const TextStyle(fontSize: 30))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Text(text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14 * MediaQuery.of(context).textScaleFactor)),
              ),
            ],
          ),
          onPressed: () {
            action(text, context);
          }),
    );
  }
}
