import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  //or final VoidCallback answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  ///todo why it's differ ??
  // Quiz(List<Map<String, Object>> questions, Function() answerQuestion) {
  //   this.questions = questions;
  //   this.answerQuestion = answerQuestion;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      /// restructuring widget into smaller code,
      /// in sdk: ">=2.12.0" --> need to tell Flutter this will never null then, used as String at the end
      Question(questions[questionIndex]['questionText'] as String),

      /// NOTE: MAP LISTS inside WIDGET: need a dynamic answers - since we do have dynamic values
      /// map thrown error w/out "as List<String>" bcs Dart can't read the answers inside the map string. then, cast it by telling Dart we expecting List of string
      /// new ... = spread operator does take a list, then pull all the values out of it, then add them into individual values. mcm foreach!!
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
          .map((answer) {
        ///need to return a widget
        /// pass () => answerQuestion() ---> will triggering the whole function only when its pressed
        return Answer(() => answerQuestion(answer['score']) as String,
            answer['text'] as String);
      }).toList()
    ]);
  }
}
