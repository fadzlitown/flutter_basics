import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //final doesn't change!
  final Function selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  /// NOTE: NUll System in Dart
  /// - Nullable types : can contain either a value or null. cannot use var in this instance.
  ///    -eg.  String? name;
  ///
  /// - Non-Nullable types: only contain values. Nulls are not allowed, throw error
  ///  - then null check required!!
  /// */

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        /// eg annonymous func - single line
        onPressed: selectHandler,
        child: Text(answerText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
      ),
    );
  }
}
